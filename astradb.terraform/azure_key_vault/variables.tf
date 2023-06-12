variable "resourceGroupName" {
  type        = string
  description = "Resource group name"
}

variable "region" {
  type        = string
  description = "Region to be deployed"
}

variable "keyVaultName" {
  type        = string
  description = "AstraDB Main Key Vault"
}

variable "keyVaultSku" {
  type        = string
  description = "AstraDB Main Key Vault SKU"
}

variable "softDeleteRetentionDays" {
  type        = number
  description = "Software Delete Retention Days"
  default     = 7
}
