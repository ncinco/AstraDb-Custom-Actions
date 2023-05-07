terraform {
  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "tfssa"
    container_name       = "tfstate"
    key                  = "tfstate.tfstate"
  }
}
 
terraform {
  required_providers {
    astra = {
      source  = "datastax/astra"
      version = ">=1.0.0"
    }
  }
}

variable "token" {}

provider "astra" {
  // This can also be set via ASTRA_API_TOKEN environment variable.
  token = var.token
}
