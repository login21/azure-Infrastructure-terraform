resource "azurerm_storage_data_lake_gen2_filesystem" "data_lake" {
  name               = var.name
  storage_account_id = var.storage_account_id
  properties = var.properties

 dynamic "ace" {
    for_each = var.ace
    content {
      scope = ace.value.scope
      type  = ace.value.type
      permissions  = ace.value.permissions
      
    }
  }
 
}

resource "azurerm_storage_data_lake_gen2_path" "data_path" {
  count = var.create_data_lake_path ? 1 : 0

  path               = var.path
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.data_lake.name
  storage_account_id = var.storage_account_id
  resource           = "directory"
}