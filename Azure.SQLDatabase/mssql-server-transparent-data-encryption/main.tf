
resource "azurerm_mssql_server_transparent_data_encryption" "mssql_tde" {
  server_id        = var.mssql_server_id
  key_vault_key_id = var.key_vault_key_id
}
