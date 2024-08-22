data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

resource "azurerm_recovery_services_vault" "recovery_services_vault" {
  name                = var.name
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  sku                 = var.sku
  soft_delete_enabled = var.soft_delete_enabled
  identity {
    type = var.identity.type
  }
  tags = var.tags
}