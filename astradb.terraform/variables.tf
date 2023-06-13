variable "azure_region" {
  type        = string
  description = "Azure primary region. Command line argument passing to Terraform."
  default     = "Australia East"
}

variable "token" {
  type        = string
  description = "Access token for AstraDB control plane activities. Stored in GitHub secured variable."
}

variable "azure_subscription_id" {
  type        = string
  description = "The Azure subscription ID for all resources to be created in. Command line argument passing to Terraform."
  default     = "a5e8ce79-b0ec-41a2-a51c-aee927f1d808"
}

variable "azure_rg_name" {
  type        = string
  description = "The Azure resource group name of all the resources in this repo. Command line argument passing to Terraform."
  default     = "dsl-roles-token-exp"
}

variable "azure_key_vault_name" {
  type        = string
  description = "The main Azure Key Vault for DataStax client secret and access token."
  default     = "kv-astradb-test"
}

variable "datastax_org_id" {
  type        = string
  description = "The Org ID in DataStax environment, it is equivalent to DEV, UAT and Prod. Command line argument passing to Terraform."
  default     = "9ffa81f4-288b-49b0-b580-4c45e9155592" # the free subscription
}

variable "azure_key_vault_sku" {
  type        = string
  description = "The key vault SKU."
  default     = "standard"
}

# We need to review if we need AZURE_USERNAME in env variable if pipeline is run by Service Principal
