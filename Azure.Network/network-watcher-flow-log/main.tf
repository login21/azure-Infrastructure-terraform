data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

data "azurerm_network_watcher" "network_watcher" {
  name                = var.network_watcher_name
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

data "azurerm_log_analytics_workspace" "laws" {
  name                = var.laws_name
  resource_group_name = var.laws_rg_name
}

resource "azurerm_network_watcher_flow_log" "flow_log" {
  network_watcher_name = var.network_watcher_name
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  name                 = var.name

  network_security_group_id = var.network_security_group_id
  storage_account_id        = var.storage_account_id
  enabled                   = var.enabled
  version                   = var.nw_version
  tags                      = var.tags

  retention_policy {
    enabled = var.retention_policy.enabled
    days    = var.retention_policy.days
  }

  traffic_analytics {
    enabled               = var.traffic_analytics.enabled
    workspace_id          = data.azurerm_log_analytics_workspace.laws.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.laws.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.laws.id
    interval_in_minutes   = var.traffic_analytics.interval_in_minutes
  }
}