data "azurerm_resource_group" "app_service_rg" {
  name = var.resource_group_name
}

data "azurerm_dns_zone" "app_dns_zone" {
  name                = var.dns_zone_name
  resource_group_name = "search-service"
}

data "azurerm_service_plan" "app_service_plan" {
  name                = var.service_plan_name
  resource_group_name = data.azurerm_resource_group.app_service_rg.name
}

data "azurerm_windows_web_app" "win_web_app" {
  name                = var.web_app_name
  resource_group_name = data.azurerm_resource_group.app_service_rg.name
}

data "azurerm_dns_txt_record" "dns_txt_record" {
  name                = var.dns_txt_record_name
  zone_name           = data.azurerm_dns_zone.app_dns_zone.name
  resource_group_name = data.azurerm_resource_group.app_service_rg.name
}
