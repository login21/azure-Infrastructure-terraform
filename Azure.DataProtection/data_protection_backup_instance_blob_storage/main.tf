data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

resource "azurerm_data_protection_backup_vault" "data_backup_vault" {
  name                = var.backup_vault_name
  resource_group_name = var.resource_group_name
  location            = var.location
  datastore_type      = var.datastore_type
  redundancy          = var.redundancy
  
  identity {
    type = var.identity.type
  }
  tags = var.tags
}

resource "azurerm_role_assignment" "role_assignment" {
  # scope                = [azurerm_storage_account.example.id]  
  scope                = var.scope
  role_definition_name = "Storage Account Backup Contributor"
  principal_id         = azurerm_data_protection_backup_vault.data_backup_vault.identity[0].principal_id
}

resource "azurerm_data_protection_backup_policy_blob_storage" "blob_storgage_backup_policy" {
  name               = var.storage_backup_policy_name
  vault_id           = azurerm_data_protection_backup_vault.data_backup_vault.id
  retention_duration = var.retention_duration
}

resource "azurerm_data_protection_backup_instance_blob_storage" "backup_instance_blob_storage" {
  depends_on = [
    azurerm_data_protection_backup_policy_blob_storage.blob_storgage_backup_policy
  ]
  name               = var.name
  vault_id           = azurerm_data_protection_backup_vault.data_backup_vault.id
  location           = data.azurerm_resource_group.resource_group.location
  storage_account_id = var.storage_account_id
  # backup_policy_id   = azurerm_data_protection_backup_policy_blob_storage.blob_storgage_backup_policy.id
  backup_policy_id   = azurerm_data_protection_backup_policy_blob_storage.blob_storgage_backup_policy.id

  # depends_on = [azurerm_role_assignment.example]
}