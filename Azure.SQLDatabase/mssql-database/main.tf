
resource "azurerm_mssql_database" "mssql_db" {
  name                        = var.mssql_dbname
  server_id                   = var.mssql_server_id
  auto_pause_delay_in_minutes = var.auto_pause_delay_in_minutes
  create_mode                 = var.create_mode
  max_size_gb                 = var.max_size_gb
  sku_name                    = var.sku_name
  min_capacity                = var.min_capacity
  storage_account_type        = var.storage_account_type
  elastic_pool_id             = var.elastic_pool_id
  tags                        = var.tags

  timeouts {
    create = lookup(var.timeouts, "create")
    delete = lookup(var.timeouts, "delete")
    read   = lookup(var.timeouts, "read")
    update = lookup(var.timeouts, "update")
  }

  lifecycle {
    ignore_changes = [
      tags,
      elastic_pool_id
    ]
  }

}
