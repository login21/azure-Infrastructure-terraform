output "name" {
  description = "The name of the newly created MS SQL Database"
  value       = azurerm_mssql_database.mssql_db.*.name
}

output "sku_name" {
  description = "The SKU used by the database."
  value       = azurerm_mssql_database.mssql_db.sku_name
}
