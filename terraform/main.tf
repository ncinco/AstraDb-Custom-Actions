provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "default" {
  name     = "container-registry-rg"
  location = "East US 2"

  tags = {
    environment = "Dev"
  }
}

resource "azurerm_container_registry" "acr" {
  name                = "kspcontainerregistry"
  resource_group_name = azurerm_resource_group.default.name
  location            = "East US 2"
  sku                 = "Standard"
  admin_enabled       = true
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  value     = azurerm_container_registry.acr.admin_username
  sensitive = true
}

output "acr_admin_password" {
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}
