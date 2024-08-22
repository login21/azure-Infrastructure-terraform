resource "azurerm_mssql_server" "mssql_server" {
  name                         = var.mssql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  identity {
    type = var.identity.type
  }
  connection_policy             = var.connection_policy
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags

  dynamic "azuread_administrator" {
    for_each = var.azuread_administrator[*]

    content {
        login_username = var.azuread_administrator.login_username
        object_id = var.azuread_administrator.object_id
    }
  } 

  timeouts {
    create = lookup(var.timeouts, "create")
    delete = lookup(var.timeouts, "delete")
    read   = lookup(var.timeouts, "read")
    update = lookup(var.timeouts, "update")
  }

}
