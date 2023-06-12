terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.57.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_deleted_secrets_on_destroy = true
      recover_soft_deleted_secrets          = true
    }
  }
}

data "azurerm_client_config" "current" {
}

resource "azurerm_key_vault" "astraDBMainKeyVault" {
  name                          = var.keyVaultName
  location                      = var.region
  resource_group_name           = var.resourceGroupName
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sku_name                      = var.keyVaultSku
  soft_delete_retention_days    = var.softDeleteRetentionDays
  public_network_access_enabled = true
  enable_rbac_authorization     = true

  tags = {
    created-by = "astradb-pipeline"
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]

  }

  network_acls {
    default_action = "Deny"
    bypass         = "None"
    # we need zScaler IP anchoring IP addresses for MMD local development, GitHub Action and all application workloads IPs.
    ip_rules = ["140.168.254.122/32", "140.168.254.123/32", "140.168.254.36/32", "140.168.254.136/32", "124.248.141.139/32", "124.248.141.144/32", "124.248.141.62"]
  }


}
