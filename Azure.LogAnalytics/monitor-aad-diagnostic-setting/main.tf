data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

data "azurerm_log_analytics_workspace" "laws" {
  name                = var.laws_name
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

resource "azurerm_monitor_aad_diagnostic_setting" "aad_diagnostic_setting" {
  name                       = var.name
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.laws.id

  dynamic "log" {
    for_each = var.log

    content {
      # category = lookup(log.value, "category", "AuditLogs")
      # enabled  = lookup(log.value, "enabled", "true")
      category = log.value.category
      enabled  = log.value.enabled
      retention_policy {
        enabled = var.log_rentention_enabled
        days = var.log_rention_day
      }
      # dynamic "retention_policy" {
      #   for_each = log.value.retention_policy

      #   content {
      #     enabled = retention_policy.value.enabled_retention_policy
      #     days    = retention_policy.value.days
      #   }
      # }
    }
  }
}