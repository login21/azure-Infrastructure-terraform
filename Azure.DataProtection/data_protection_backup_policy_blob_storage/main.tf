
resource "azurerm_data_protection_backup_policy_blob_storage" "backup_policy_blob_storage" {
  name               = var.name
  vault_id           = var.backup_vault_id
  retention_duration = var.retention_duration
}