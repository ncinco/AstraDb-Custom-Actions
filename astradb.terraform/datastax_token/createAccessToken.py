import requests
import json
import subprocess
import os
import pytz
from azure.keyvault.secrets import SecretClient
from azure.identity import DefaultAzureCredential
from datetime import datetime, timedelta

# Set variables passed from Terraform and other variables.
access_token = os.environ["access_token"]
role_name = os.environ["role_name"]
requestor_email = os.environ["requestor_email"]
requestor_squad = os.environ["requestor_squad"]
azure_principal = os.environ["azure_principal"]
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

# Get role ID based on role name
try: 
  rolesResponse = requests.get(datastaxControlPlaneRolesUrl, headers=headers)

except requests.exceptions.HTTPError as error:
  print(error)
  exit(1)

# find out the role id based on the role name as role name is unique in AstraDB
matchedObjects = list(filter(lambda x:x['name']==f'{role_name}', rolesResponse.json()))
numberOfMatchedObjects = len(matchedObjects)
if numberOfMatchedObjects != 1:
  print(f'The role: {role_name} returns {numberOfMatchedObjects}. Make sure the role name input is correct and that only belongs to a single role ID.')
  exit(1)

# set role_id for further use in the process
role_id = matchedObjects[0]['id']
print(f'AstraDB Role ID retrieved: {role_id}')

# Create AstraDB token by DevOps API
payload = {
    'roles': [role_id]
}

try:
  response = requests.post(
    datastaxControlPlaneTokenUrl, data=json.dumps(payload), headers=headers
  )
  response.raise_for_status()
except requests.exceptions.HTTPError as error:
  print(error)
  exit(1)

responseJson = response.json()
print('script executed to create token for role: %s' % role_name)
print('client id generated: %s' % responseJson.get('clientId'))

# Put clientSecret from AstraDB to Azure Key Vault
# status - active->rotating->active
tags = {
  'created-by' : 'astradb-pipeline',
  'seed_clientId' : responseJson.get('clientId'),
  'clientId' : responseJson.get('clientId'),
  'generatedOn' : responseJson.get('generatedOn'),
  'astraDbRole' : role_id,
  'astraDbOrgId' : responseJson.get('orgId'),
  'requestorEmail' : requestor_email,
  'requestorSquad' : requestor_squad,
  'azurePrincipal' : azure_principal,
  'status' : 'active'
}

credential = DefaultAzureCredential()

secretClient = SecretClient(vault_url=azure_key_vault_uri, credential=credential)
secretName = responseJson.get('clientId') + "-ClientSecret"
secretValue = responseJson.get('secret')

print('Setting secret to Azure Key Vault..')
secretClient.set_secret(secretName, secretValue)
secretClient.update_secret_properties(secretName, content_type="text/plain", tags=tags, not_before=datetime.now(pytz.timezone("Etc/GMT+12")), expires_on=datetime.now(pytz.timezone("Etc/GMT+12")) + timedelta(hours=secretExpiryHours))
print('ClientSecret put to Azure Key Vault with secret name: %s' % secretClient.get_secret(secretName))

# grant read only access to subscription for given principal
subscriptionRbacCommand = f'az role assignment create --role "{rbacKeyVaultReader}" --assignee {azure_principal} --scope /subscriptions/{azure_subscription_id}'
print('clientSecretRbacCommand: ' + subscriptionRbacCommand )

try:
  result = subprocess.run(subscriptionRbacCommand, capture_output=True, text=True, shell=True, check=True)
except subprocess.CalledProcessError as error:
  print(error)
  exit(1)

# set RBAC scope to only allow access secret for given principal
clientSecretRbacCommand = f'az role assignment create --role "{rbackKeyVaultSecretsUser}" --assignee {azure_principal} --scope /subscriptions/{azure_subscription_id}/resourcegroups/{azure_resource_group_name}/providers/Microsoft.KeyVault/vaults/{azure_key_vault_name}/secrets/{secretName}'
print('clientSecretRbacCommand: ' + clientSecretRbacCommand )

try:
  result = subprocess.run(clientSecretRbacCommand, capture_output=True, text=True, shell=True, check=True)
except subprocess.CalledProcessError as error:
  print(error)
  exit(1)

# put accessToken from AstraDB to Azure Key Vault
tokenSecretClient = SecretClient(vault_url=azure_key_vault_uri, credential=credential)
tokenSecretName = responseJson.get('clientId') + "-AccessToken"
tokenSecretValue = responseJson.get('token')

print('Setting access token to Azure Key Vault..')
tokenSecretClient.set_secret(tokenSecretName, tokenSecretValue)
tokenSecretClient.update_secret_properties(tokenSecretName, content_type="text/plain", tags=tags, not_before=datetime.now(pytz.timezone("Etc/GMT+12")), expires_on=datetime.now(pytz.timezone("Etc/GMT+12")) + timedelta(hours=secretExpiryHours))
print("Access token put to Azure Key Vault with secret name: %s" % tokenSecretClient.get_secret(tokenSecretName))

# set RBAC scope to only allow access secret for given principal
tokenRbacCommand = f'az role assignment create --role "{rbackKeyVaultSecretsUser}" --assignee {azure_principal} --scope /subscriptions/{azure_subscription_id}/resourcegroups/{azure_resource_group_name}/providers/Microsoft.KeyVault/vaults/{azure_key_vault_name}/secrets/{tokenSecretName}'
print('tokenRbacCommand: ' + tokenRbacCommand )

try:
  result = subprocess.run(tokenRbacCommand, capture_output=True, text=True, shell=True, check=True)
except subprocess.CalledProcessError as error:
  print(error)
  exit(1)

print("Token provisioning completed and secrets stored to Azure Key Vault.")
exit(0)
