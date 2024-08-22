data "azurerm_resource_group" "app_service_rg" {
  name = var.resource_group_name
}

data "azurerm_service_plan" "app_service_plan" {
  name                = var.service_plan_name
  resource_group_name = data.azurerm_resource_group.app_service_rg.name
}

data "azurerm_windows_web_app" "win_web_app" {
  name                = var.web_app_name
  resource_group_name = data.azurerm_resource_group.app_service_rg.name
}

resource "azurerm_app_service_custom_hostname_binding" "app_custom_hostname" {
  hostname            = var.hostname
  app_service_name    = data.azurerm_windows_web_app.win_web_app.name
  resource_group_name = data.azurerm_resource_group.app_service_rg.name
}
