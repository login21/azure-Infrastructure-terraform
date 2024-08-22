output "name" {
  description = "The name of the SQL virtual network rule."
  value       = azurerm_mssql_virtual_network_rule.db_vnet_rule.name
}
