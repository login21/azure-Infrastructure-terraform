data "azurerm_resource_group" "db_rg" {
  name = var.resource_group_name
}

data "azurerm_mssql_server" "db_mssql_server" {
  name                = var.mssql_server_name
  resource_group_name = data.azurerm_resource_group.db_rg.name
}

resource "azurerm_mssql_outbound_firewall_rule" "db_outbound_fwrule" {
  name      = var.outbound_fw_rulename
  server_id = azurerm_mssql_server.db_mssql_server.id
}
