output "name" {
  description = "The name of the newly created firewall rule"
  value       = azurerm_mssql_firewall_rule.mssql_firewall_rule.name
}
