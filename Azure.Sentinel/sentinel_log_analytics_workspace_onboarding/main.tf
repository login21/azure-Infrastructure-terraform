data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

data "azurerm_log_analytics_workspace" "laws" {
  name                = var.laws_name
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

resource "azurerm_sentinel_log_analytics_workspace_onboarding" "law_onboarding" {
  resource_group_name          = data.azurerm_resource_group.resource_group.name
  workspace_name               = data.azurerm_log_analytics_workspace.laws.name
  customer_managed_key_enabled = var.customer_managed_key_enabled
}