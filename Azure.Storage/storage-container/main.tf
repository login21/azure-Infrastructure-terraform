## Resource group reference ##
data "azurerm_resource_group" "storage_rg" {
  name = var.resource_group_name
}

data "azurerm_storage_account" "storage_account" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.storage_rg.name
}

resource "azurerm_storage_container" "blob_storage_container" {
  name                  = var.blob_storage_container_name
  storage_account_name  = data.azurerm_storage_account.storage_account.name
  container_access_type = var.container_access_type
}