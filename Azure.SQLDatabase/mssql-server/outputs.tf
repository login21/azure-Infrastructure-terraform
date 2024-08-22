output "name" {
  description = "The name of the newly created Microsoft SQL Server."
  value       = azurerm_mssql_server.mssql_server.name
}

output "id" {
  description = "The ID of the newly created Microsoft SQL Server"
  value       = azurerm_mssql_server.mssql_server.id

}

output "identity" {
  description = "The ID of the newly created Microsoft SQL Server"
  value       = azurerm_mssql_server.mssql_server.identity
}

