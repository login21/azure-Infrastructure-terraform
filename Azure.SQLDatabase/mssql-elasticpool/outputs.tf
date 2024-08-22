output "name" {
  description = "The name of the newly created Elastic Pool."
  value       = azurerm_mssql_elasticpool.db_mssql_elasticpool.name
}

output "id" {
  description = "The id of the newly created Elastic Pool."
  value       = azurerm_mssql_elasticpool.db_mssql_elasticpool.id
}
