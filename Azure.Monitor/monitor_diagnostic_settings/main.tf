
resource "azurerm_monitor_diagnostic_setting" "example" {
  name                       = var.name
  target_resource_id         = var.target_resource_id
  log_analytics_workspace_id = var.laws_id

  dynamic "enabled_log" {
    for_each = var.enabled_log

    content {
      category = enabled_log.value.category
      /* retention_policy {
        enabled = var.log_enabled
        days    = var.log_days

      } */
    }
  }
  dynamic "metric" {
    for_each = var.metric

    content {
      category = metric.value.category
      /* retention_policy {
        enabled = var.retention_policy_enabled
        days    = var.retention_policy_days
      } */
    }
  }
}
