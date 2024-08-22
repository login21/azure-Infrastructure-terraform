data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

data "azurerm_log_analytics_workspace" "laws" {
  name                = var.laws_name
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

resource "azurerm_monitor_activity_log_alert" "activity_log_alert" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.resource_group.name
  scopes              = var.scopes
  description         = var.description
  enabled             = var.enabled
  tags                = var.tags

  # dyanmic "criteria" {
  #   for_each = var.criteria

  #   content {
  #     category = criteria.value.category
  #   }
  # }
  criteria {
    category = var.criteria.category
  }
}