data "azurerm_resource_group" "db_rg" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "db_vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.db_rg.name
}

data "azurerm_subnet" "db_subnet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.db_vnet.name
  resource_group_name  = data.azurerm_resource_group.db_rg.name
}

data "azurerm_mssql_server" "db_mssql_server" {
  name                = var.mssql_server_name
  resource_group_name = data.azurerm_resource_group.db_rg.name
}

resource "azurerm_mssql_virtual_network_rule" "db_vnet_rule" {
  name      = var.db_vnet_rule_name
  server_id = data.azurerm_mssql_server.db_mssql_server.id
  subnet_id = data.azurerm_subnet.db_subnet.id
}
