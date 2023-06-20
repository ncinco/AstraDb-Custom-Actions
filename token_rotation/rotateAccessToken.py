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

for secretProperty in secretProperties:
  print(f"id : {secretProperty.id}  name: {secretProperty.name} generatedOn: {secretProperty.tags['generatedOn']} status: {secretProperty.tags['status']}")
  
  generatedOn = parser.parse(secretProperty.tags['generatedOn']).replace(tzinfo=None)
  time_diff_in_hours = (datetime.now() - generatedOn).total_seconds() / 3600
  
  if secretProperty.tags['status'] == 'active' and time_diff_in_hours > 4.0:
    clientId = secretProperty.name.split('-')[0]

    try:
      tokensResponse = requests.get(datastaxControlPlaneTokenUrl, headers=headers, timeout=30)
      tokensResponse.raise_for_status()
    except requests.exceptions.HTTPError as error:
      print(error)
      exit(1)

    matchedObjects = list(filter(lambda x:x['clientId']==clientId, tokensResponse.json()['clients']))
    
    print(f'id : {secretProperty.id} has expired')

    # set client_id for further use in the process
    client_id = matchedObjects[0]['clientId']
    roles = matchedObjects[0]['roles']
    generatedOn = matchedObjects[0]['generatedOn']
    print(f'Found matching token: Client Id: {client_id} Roles: {roles} Generated On: {generatedOn}')
    
    print(f'json payload: {json.dumps(roles)}')

    # create new token first before deleting the old one
    try:
      payload = f'{"roles" : {json.dumps(roles)}}'
      tokensResponse = requests.post(datastaxControlPlaneTokenUrl, data=json.dumps(payload), headers=headers, timeout=30)
      tokensResponse.raise_for_status()
    except requests.exceptions.HTTPError as error:
      print(error)
      exit(1)

    tokensResponseJson = tokensResponse.json()

    print(f'Token created: {tokensResponseJson}')
    
    # update the secret
    credential = DefaultAzureCredential()
    secretClient = SecretClient(vault_url=azure_key_vault_uri, credential=credential)
    old_secret = secretClient.get_secret(secretProperty.name);
    secretName = secretProperty.name
    secretValue = tokensResponseJson.get('secret')

    print(f'Old tags: {old_secret.tags}')

    tags = old_secret.tags
    tags["status"] = 'rotating'
    tags["clientId"] = tokensResponseJson.get('clientId')

    print(f'New tags: {old_secret.tags}')
    
    print('Setting secret to Azure Key Vault..')
    secretClient.set_secret(secretName, secretValue)
    secretClient.update_secret_properties(secretName, content_type="text/plain", tags=tags, not_before=datetime.now(pytz.timezone("Etc/GMT+12")), expires_on=datetime.now(pytz.timezone("Etc/GMT+12")) + timedelta(hours=secretExpiryHours))
    print('ClientSecret put to Azure Key Vault with secret name: %s' % secretClient.get_secret(secretName))

    # revoke old token
    try:
      tokensResponse = requests.delete(f'{datastaxControlPlaneTokenUrl}/{client_id}', headers=headers, imeout=30)
      tokensResponse.raise_for_status()
    except requests.exceptions.HTTPError as error:
      print(error)
      exit(1)

    print(f'Old token revoked.')

print("Token rotation completed and secrets stored to Azure Key Vault.")
exit(0)
