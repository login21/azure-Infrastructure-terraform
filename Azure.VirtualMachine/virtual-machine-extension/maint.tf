# data "azurerm_resource_group" "vnet_rg" {
#   name = var.vnet_resource_group_name
# }

# data "azurerm_virtual_network" "vnet" {
#   name                = var.vnet_name
#   resource_group_name = data.azurerm_resource_group.vnet_rg.name
# }

# data "azurerm_subnet" "subnet" {
#   name                 = var.subnet_name
#   virtual_network_name = data.azurerm_virtual_network.vnet.name
#   resource_group_name  = data.azurerm_resource_group.vnet_rg.name
# }

# data "azurerm_windows_virtual_machine" "windows_vm" {
#   name                = var.windows_vm_name
#   resource_group_name = data.azurerm_resource_group.vnet_rg.name
# }

resource "azurerm_virtual_machine_extension" "vm_extension" {
  name                 = var.name
  virtual_machine_id   = var.virtual_machine_id
  publisher            = var.publisher
  type                 = var.type
  type_handler_version = var.type_handler_version
  auto_upgrade_minor_version = var.auto_upgrade_minor_version
  automatic_upgrade_enabled = var.automatic_upgrade_enabled
  settings = var.settings
  # <<SETTINGS
  #   {
  #       "Name": "${var.active_directory_domain}",
  #       "OUPath": "${var.ou_path != null ? var.ou_path : ""}",
  #       "User": "${var.active_directory_username}
  #       "Restart": "true",
  #       "Options": "3"
  #       "Password": "${var.active_directory_password}"
  #   }
  # SETTINGS  
  tags = var.tags
}

# resource "azurerm_virtual_machine_extension" "ama" {
#   count                      = var.server_count
#   name                       = join("-", [local.prefix, count.index + 1, "ama"])
#   virtual_machine_id         = element(module.vm-win.vm_id, count.index)
#   publisher                  = "Microsoft.Azure.Monitor"
#   type                       = "AzureMonitorWindowsAgent"
#   type_handler_version       = "1.10"
#   auto_upgrade_minor_version = "true"
#   depends_on                 = [module.vm-win, azurerm_log_analytics_workspace.logging_ws]

#   tags = merge(var.tags, tomap({ "firstapply" = timestamp() }))

#   lifecycle {
#     ignore_changes = [tags]
#   }
# }