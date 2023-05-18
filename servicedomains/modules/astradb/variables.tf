variable "token" {}

variable "environment" {}

variable "database" {}

# backend - azure blob storage
variable "resourcegroup" {
  description = "The resource group where the storage account is."
}
variable "storageaccountname" {
  description = "The name of the storage account."
}
variable "storagecontainer" {
  description = "The container name where the terraform stage to be stored."
}