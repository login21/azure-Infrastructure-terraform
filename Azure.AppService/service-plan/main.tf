# This resource has been deprecated in version 3.0 of the AzureRM provider and will be removed in version 4.0. Please use azurerm_linux_web_app and azurerm_windows_web_app resources instead.

data "azurerm_resource_group" "app_service_rg" {
  name = var.resource_group_name

}

resource "azurerm_service_plan" "app_service_plan" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name
  tags                = var.tags
}
