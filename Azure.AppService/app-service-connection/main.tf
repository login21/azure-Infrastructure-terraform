data "azurerm_resource_group" "app_service_rg" {
  name = var.resource_group_name
}

data "azurerm_storage_account" "app_storage_account" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.app_service_rg.name
}

data "azurerm_mssql_server" "app_mssql_server" {
  name                = var.mssql_server_name
  resource_group_name = data.azurerm_resource_group.app_service_rg.name
}

data "azurerm_mssql_database" "app_mssql_database" {
  name      = var.mssql_dbname
  server_id = data.azurerm_mssql_server.app_mssql_server.id
}

data "azurerm_service_plan" "app_service_plan" {
  name                = var.service_plan_name
  resource_group_name = data.azurerm_resource_group.app_service_rg.name
}

data "azurerm_windows_web_app" "win_web_app" {
  name                = var.win_webapp_name
  resource_group_name = data.azurerm_resource_group.app_service_rg.name
}

data "azurerm_key_vault" "app_keyvault" {
  name                = var.keyvault_name
  resource_group_name = data.azurerm_resource_group.app_service_rg.name
}

resource "azurerm_app_service_connection" "app_sc" {
  name               = var.name // service connection name
  app_service_id     = var.app_service_id
  target_resource_id = var.target_resource_id
  authentication {
    type      = var.auth_type
    client_id = var.client_id
  }

  client_type   = var.client_type
  vnet_solution = var.vnet_solution

  secret_store {
    key_vault_id = data.azurerm_key_vault.app_keyvault
  }
}
