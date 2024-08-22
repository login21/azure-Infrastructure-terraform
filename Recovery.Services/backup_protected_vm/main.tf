data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

data "azurerm_recovery_services_vault" "vault" {
  name                = var.recovery_vault_name
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

data "azurerm_backup_policy_vm" "backup_policy_vm" {
  name                = var.vm_backup_policy_name
  recovery_vault_name = data.azurerm_recovery_services_vault.vault.name
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

resource "azurerm_backup_protected_vm" "vm_backup" {
  resource_group_name = data.azurerm_resource_group.resource_group.name
  recovery_vault_name = data.azurerm_recovery_services_vault.vault.name
  source_vm_id        = var.source_vm_id
  backup_policy_id    = data.azurerm_backup_policy_vm.backup_policy_vm.id
}