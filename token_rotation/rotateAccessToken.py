import requests
import json
import subprocess
import os
import pytz
from azure.keyvault.secrets import SecretClient
from azure.identity import DefaultAzureCredential
from datetime import datetime, timedelta
from dateutil import parser

# Set variables passed from Terraform and other variables.
access_token = os.environ["access_token"]
azure_key_vault_name = os.environ["azure_key_vault_name"]
azure_subscription_id = os.environ["azure_subscription_id"]
azure_resource_group_name = os.environ["azure_resource_group_name"]
datastaxControlPlaneRolesUrl = 'https://api.astra.datastax.com/v2/organizations/roles'
datastaxControlPlaneTokenUrl = 'https://api.astra.datastax.com/v2/clientIdSecrets'
azure_key_vault_uri = f'https://{azure_key_vault_name}.vault.azure.net'
rbacKeyVaultReader = 'Key Vault Reader'
rbackKeyVaultSecretsUser = 'Key Vault Secrets User'
secretExpiryHours = 24

# Common http headers
headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer ' + access_token,
}

credential = DefaultAzureCredential()
secretClient = SecretClient(vault_url=azure_key_vault_uri, credential=credential)

secretProperties = secretClient.list_properties_of_secrets()

# get all tokens
try:
  tokensResponse = requests.get(datastaxControlPlaneTokenUrl, headers=headers, timeout=30)
  print(f'tokensResponse: {tokensResponse.json()}')
  tokensResponse.raise_for_status()
except requests.exceptions.HTTPError as error:
  print(error)
  exit(1)

for secretProperty in secretProperties:
  generatedOn = parser.parse(secretProperty.tags['generatedOn']).replace(tzinfo=None)
  time_diff_in_hours = (datetime.now() - generatedOn).total_seconds() / 3600

  # check expiration, has to be active and more than 4 hours age
  if secretProperty.tags['status'] == 'active' and time_diff_in_hours > 4.0:
    clientId = secretProperty.name.split('-')[0]

    # print details
    print(f"Secret details to be rotated name: {secretProperty.name} generatedOn: {secretProperty.tags['generatedOn']} status: {secretProperty.tags['status']} time diff: {time_diff_in_hours}")

    # find matching token
    matchedObjects = list(filter(lambda x:x['clientId']==clientId, tokensResponse.json()['clients']))
    
    print(f'id : {secretProperty.id} has expired, renewing...')
    print(f'matchedObjects details: {matchedObjects }')

    # can't find any token, continue to next item
    if not matchedObjects:
      print(f'No matching token found, continue to next item.')
      continue

    # set client_id for further use in the process
    client_id = matchedObjects[0]['clientId']
    roles = matchedObjects[0]['roles']
    generatedOn = matchedObjects[0]['generatedOn']
    print(f'Found matching token: Client Id: {client_id} Roles: {roles} Generated On: {generatedOn}')
    
    # create new token first before deleting the old one
    try:
      payload = {'roles' : roles}
      payloadJson = json.dumps(payload)
      print(f'Json Payload: {payloadJson}')
      newTokenReponse = requests.post(datastaxControlPlaneTokenUrl, data=payloadJson, headers=headers, timeout=30)
      newTokenReponse.raise_for_status()
    except requests.exceptions.HTTPError as error:
      print(error)
      exit(1)

    newTokenReponseJson = newTokenReponse.json()

    print(f'Token created: {newTokenReponseJson}')
    
    # get the secret
    credential = DefaultAzureCredential()
    secretClient = SecretClient(vault_url=azure_key_vault_uri, credential=credential)
    old_secret = secretClient.get_secret(secretProperty.name);
    secretName = secretProperty.name
    secretValue = newTokenReponseJson.get('secret')

    print(f'get the secret details: {secretProperty.name}')
    print(f'Old tags: {old_secret.properties.tags}')

    tags = old_secret.properties.tags
    tags["status"] = 'rotating'
    tags["clientId"] = newTokenReponseJson.get('clientId')

    print(f'New tags: {old_secret.properties.tags}')
    
    print('Setting secret to Azure Key Vault..')
    secretClient.set_secret(secretName, secretValue)
    secretClient.update_secret_properties(secretName, content_type="text/plain", tags=tags, not_before=datetime.now(pytz.timezone("Etc/GMT+12")), expires_on=datetime.now(pytz.timezone("Etc/GMT+12")) + timedelta(hours=secretExpiryHours))
    print('ClientSecret put to Azure Key Vault with secret name: %s' % secretClient.get_secret(secretName))

    # revoke old token
    try:
      deleteTokenResponse = requests.delete(f'{datastaxControlPlaneTokenUrl}/{client_id}', headers=headers, timeout=30)
      deleteTokenResponse.raise_for_status()
    except requests.exceptions.HTTPError as error:
      print(error)
      exit(1)

    # update secret tag to active
    print('Setting secret to Azure Key Vault..')
    old_secret = secretClient.get_secret(secretProperty.name);
    tags = old_secret.properties.tags
    tags["status"] = 'active'
    secretClient.update_secret_properties(secretName, content_type="text/plain", tags=tags, not_before=datetime.now(pytz.timezone("Etc/GMT+12")), expires_on=datetime.now(pytz.timezone("Etc/GMT+12")) + timedelta(hours=secretExpiryHours))
    print('ClientSecret put to Azure Key Vault with secret name: %s' % secretClient.get_secret(secretName))

    print(f'Old token revoked.')

print("Token rotation completed and secrets stored to Azure Key Vault.")
exit(0)
