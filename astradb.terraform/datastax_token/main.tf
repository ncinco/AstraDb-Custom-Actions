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

locals {
  token_requests = jsondecode(templatefile("./${path.module}/token_requests.tpl", {
  }))
}

resource "terraform_data" "astra_access_token_exec" {
  // we need to expect a unique input e.g. request_id so that Terraform can identify particular request
  for_each = { for request in local.token_requests.token_requests : request.request_id => request }

  provisioner "local-exec" {

    working_dir = path.module
    command     = "python3 ./createAccessToken.py"
    environment = {
      access_token              = var.token
      role_name                 = each.value.role_name
      requestor_email           = each.value.requestor_email
      requestor_squad           = each.value.requestor_squad
      azure_principal           = each.value.azure_principal
      azure_key_vault_name      = var.astradb_azure_key_vault_name
      azure_subscription_id     = var.azure_subscription_id
      azure_resource_group_name = var.azure_rg_name

      // make sure we do not print the token in terraform command prompt output
      quiet = true
    }
  }
}
