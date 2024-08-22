# -------------------------------------------------------------
# Resource Group
# -------------------------------------------------------------
module "resource_group" {
  source = "../../Azure.ResourceGroup"
  name     = var.name
  location = var.location
  tags     = var.tags
}

module "mssql_server" {
  source = "../mssql-server"
  depends_on = [
    module.resource_group
  ]
  mssql_server_name            = var.mssql_server_name
  resource_group_name          = module.resource_group.name
  location                     = var.location
  identity                     = var.identity
  sql_version                  = var.sql_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  connection_policy            = var.connection_policy
  tags                         = var.tags
}

module "mssql_database" {
  source = "../mssql-database"
  depends_on = [
    module.resource_group,
    module.mssql_server
  ]
  for_each            = var.mssql_dbname

  mssql_dbname        = each.value["name"]
  resource_group_name = module.resource_group.name
  mssql_server_id     = module.mssql_server.id
  auto_pause_delay_in_minutes = var.auto_pause_delay_in_minutes
  max_size_gb         = var.max_size_gb
  min_capacity         = var.min_capacity
  sku_name            = var.sku_name
  tags                = var.tags

}

module "mssql_elasticpool" {
  source = "../mssql-elasticpool"
  depends_on = [
    module.resource_group,
    module.mssql_server
  ]
  for_each              = var.mssql_elasticpool_name
  name                  = each.value["name"]
  resource_group_name   = module.resource_group.name
  location              = var.location
  mssql_server_name     = module.mssql_server.name
  max_size_gb           = var.ep_max_size_gb
  sku                   = var.sku
  per_database_settings = var.per_database_settings
  tags                  = var.tags
}
