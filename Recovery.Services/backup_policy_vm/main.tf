data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

data "azurerm_recovery_services_vault" "vault" {
  name                = var.recovery_vault_name
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

resource "azurerm_backup_policy_vm" "backup_policy_vm" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.resource_group.name
  recovery_vault_name = data.azurerm_recovery_services_vault.vault.name

  timezone = var.timezone

  backup {
    frequency = var.backup.frequency
    time      = var.backup.time
  }

  retention_daily {
    count = var.retention_daily.count
  }

  retention_weekly {
    count    = var.retention_weekly.count
    weekdays = var.retention_weekly.weekdays
  }
}