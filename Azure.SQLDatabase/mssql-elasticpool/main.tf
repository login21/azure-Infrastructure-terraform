
resource "azurerm_mssql_elasticpool" "db_mssql_elasticpool" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = var.mssql_server_name
  max_size_gb         = var.max_size_gb

  dynamic "sku" {
    for_each = [merge(local.default_sku, var.sku)]
    content {
      name     = lookup(sku.value, "name", "BasicPool")
      capacity = lookup(sku.value, "capacity", 100)
      tier     = lookup(sku.value, "tier", "Basic")
    }
  }

  dynamic "per_database_settings" {
    for_each = [merge(local.default_per_database_settings, var.per_database_settings)]
    content {
      min_capacity = lookup(per_database_settings.value, "min_capacity", 0)
      max_capacity = lookup(per_database_settings.value, "max_capacity", 5)
    }
  }

  timeouts {
    create = lookup(var.timeouts, "create")
    delete = lookup(var.timeouts, "delete")
    read   = lookup(var.timeouts, "read")
    update = lookup(var.timeouts, "update")
  }
 
}
