output "name" {
  description = "The name of the newly created outbound firewall rule."
  value       = azurerm_mssql_outbound_firewall_rule.db_outbound_fwrule.name
}
