data "azurerm_resource_group" "db_rg" {
  name = var.resource_group_name
}

data "azurerm_mssql_server" "db_mssql_server" {
  name                = var.mssql_server_name
  resource_group_name = data.azurerm_resource_group.db_rg.name
}

resource "azurerm_mssql_firewall_rule" "mssql_firewall_rule" {
  name             = var.fw_rule_name
  server_id        = data.azurerm_mssql_server.db_mssql_server.id
  start_ip_address = var.start_ip_address
  end_ip_address   = var.end_ip_address
}
