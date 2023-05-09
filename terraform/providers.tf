terraform {
  required_providers {
    astra = {
      source  = "datastax/astra"
      version = "=2.1.15"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.55.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "Terraform_State"
      storage_account_name = "astradbstate"
      container_name       = "development"
      key                  = "astradb_terraform.tfstate"
  }
}

variable "token" {}

provider "astra" {
  // This can also be set via ASTRA_API_TOKEN environment variable.
  token = var.token
}

provider "azurerm" {
  features {}
}

// modules for tables
module "tables" {
  source = "tables"
}
