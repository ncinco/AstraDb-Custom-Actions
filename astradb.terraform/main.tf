terraform {
  required_providers {
    astra = {
      source  = "datastax/astra"
      version = "2.1.15"
    }
  }
  
  backend "azurerm" {}
}

provider "astra" {
  // This is set via TF_VAR_token environment variable.
  token = var.token
}

// resource group for AstraDB
module "resouce_group_astradb" {
  source            = "./azure_resource_group"
  resourceGroupName = var.azure_rg_name
  region            = var.azure_region
}

// main Azure Key Vault for AstraDB
module "main_azure_key_vault" {
  source            = "./azure_key_vault"
  keyVaultName      = var.azure_key_vault_name
  region            = var.azure_region
  resourceGroupName = module.resouce_group_astradb.rg_name_out
  keyVaultSku       = var.azure_key_vault_sku
}

module "datastax_roles" {
  source          = "./datastax_roles"
  token           = var.token
  datastax_org_id = var.datastax_org_id
}

module "datastax_tokens" {
  source                       = "./datastax_token"
  token                        = var.token
  azure_subscription_id        = var.azure_subscription_id
  astradb_azure_key_vault_name = module.main_azure_key_vault.astraDBMainKeyVault_name_out
  azure_rg_name                = module.resouce_group_astradb.rg_name_out
}
