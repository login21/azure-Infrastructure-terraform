data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

resource "azurerm_data_protection_backup_vault" "data_backup_vault" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  datastore_type      = var.datastore_type
  redundancy          = var.redundancy
  identity {
    type = var.identity.type
  }
  tags = var.tags
}