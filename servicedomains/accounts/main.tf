terraform {
  required_providers {
    astra = {
      source = "datastax/astra"
      version = "2.1.15"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.55.0"
    }
  }

  backend "azurerm" {}
}

provider "astra" {
  // This can also be set via ASTRA_API_TOKEN environment variable.
  token = var.token
}

module "astradb" {
  source         = "../../terraforms/modules/astradb"
  token          = var.token
  environment    = var.environment
  database       = var.database
}
