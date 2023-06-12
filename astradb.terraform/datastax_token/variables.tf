variable "token" {
  type        = string
  description = "Access token for AstraDB control plane activities"
}

variable "astradb_azure_key_vault_name" {
  type        = string
  description = "The main Azure key vault name that stores astradb secrets."
}

variable "azure_subscription_id" {
  type        = string
  description = "The Azure subscription ID for all resources to be created in."
}

variable "azure_rg_name" {
  type        = string
  description = "The resource group name of where the Azure Key Vault is in."
}
