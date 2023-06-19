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
azure_key_vault_name = os.environ["azure_key_vault_name"]
azure_subscription_id = os.environ["azure_subscription_id"]
azure_resource_group_name = os.environ["azure_resource_group_name"]
datastaxControlPlaneRolesUrl = 'https://api.astra.datastax.com/v2/organizations/roles'
datastaxControlPlaneTokenUrl = 'https://api.astra.datastax.com/v2/clientIdSecrets'
azure_key_vault_uri = f'https://{azure_key_vault_name}.vault.azure.net'
rbacKeyVaultReader = 'Key Vault Reader'
rbackKeyVaultSecretsUser = 'Key Vault Secrets User'
secretExpiryHours = 24

credential = DefaultAzureCredential()
secretClient = SecretClient(vault_url=azure_key_vault_uri, credential=credential)

secretProperties = secretClient.list_properties_of_secrets()

for secretProperty in secretProperties:
  print(f"id : {secretProperty.id}  name: {secretProperty.name} generatedOn: {secretProperty.tags['generatedOn']} status: {secretProperty.tags['status']}")
  
  time_diff = datetime.strptime(secretProperty.tags['generatedOn'], '%m/%d/%y %H:%M:%S') - datetime.now().strftime('%m/%d/%y %H:%M:%S')
  time_diff_in_hours = time_diff.total_seconds() / 3600
  
  if secretProperty.tags['status'] == 'active' and time_diff_in_hours > 4.0:
    print(f"id : {secretProperty.id} has not expired")
  
print("Token rotation completed and secrets stored to Azure Key Vault.")
exit(0)
