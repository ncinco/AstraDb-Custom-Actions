terraform {
  required_providers {
    astra = {
      source  = "datastax/astra"
      version = ">=1.0.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "Terraform_State"
      storage_account_name = "astradbstate"
      container_name       = "development"
      key                  = "astradb_terraform.tfstate"
      access_key           = "pyY0jQ4FE4C3EzjOFSwDGnlXta1rtIuRRtZFO7RHE6GEfheiZgXsXe9EPbIqjBfDrr2vHoJ5VxNt+AStE4KIqg=="
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

resource "azurerm_resource_group" "state-demo-secure" {
  name     = "Terraform_State"
  location = "australiaeast"
}
