variable "azure_region" {
  type        = string
  description = "Azure primary region. Command line argument passing to Terraform."
  default     = "Australia East"
}

variable "token" {
  type        = string
  description = "Access token for AstraDB control plane activities. Stored in GitHub secured variable."
  default     = "AstraCS:JidKALteKigmDImudJcimeZP:5593ab3ad44fd6cdc20f4be849132fe4812a76a51433c1daa4d4f55958903635"
}

variable "azure_subscription_id" {
  type        = string
  description = "The Azure subscription ID for all resources to be created in. Command line argument passing to Terraform."
  default     = "7e36d9ff-064f-4f22-bcee-0a9c849d48f5"
}

variable "azure_rg_name" {
  type        = string
  description = "The Azure resource group name of all the resources in this repo. Command line argument passing to Terraform."
  default     = "dsl-roles-token-exp"
}

variable "azure_key_vault_name" {
  type        = string
  description = "The main Azure Key Vault for DataStax client secret and access token."
  default     = "kv-astradb-astra"
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

# Service Principal Variables
variable "azure_client_id" {
  type        = string
  description = "Service Principal Client ID"
  default     = "50595d3b-cc7f-49c3-aaa8-5b1bafa10e70"
}

variable "azure_tenant_id" {
  type        = string
  description = "Service Principal Tenant ID"
  default     = "a5e8ce79-b0ec-41a2-a51c-aee927f1d808"
}

variable "azure_client_secret" {
  type        = string
  description = "Service Principal Secret"
  default     = "PFT8Q~sYECZ55MWFPI29bDQlXMPRZ0cfANV3za3Q"
}