terraform {
  required_providers {
    astra = {
      source  = "datastax/astra"
      version = "2.1.15"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.57.0"
    }
  }
}

provider "astra" {
  // This is set via TF_VAR_token environment variable.
  token = var.token
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_deleted_secrets_on_destroy = true
      recover_soft_deleted_secrets          = true
    }
  }
}

resource "terraform_data" "astra_access_token_exec" {
  provisioner "local-exec" {

    working_dir = path.module
    command     = "python3 ./rotateAccessToken.py"
    environment = {
      access_token              = var.token
      azure_key_vault_name      = var.azure_key_vault_name
      azure_subscription_id     = var.azure_subscription_id
      azure_resource_group_name = var.azure_rg_name
      
      AZURE_CLIENT_ID           = var.azure_client_id
      AZURE_TENANT_ID           = var.azure_tenant_id
      AZURE_CLIENT_SECRET       = var.azure_client_secret

      // make sure we do not print the token in terraform command prompt output
      quiet = false
    }
  }
}