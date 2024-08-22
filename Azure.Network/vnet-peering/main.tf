/* data "azurerm_virtual_network" "remote_vent" {
  name                = var.remote_virtual_network_name
  resource_group_name = var.remote_vnet_resource_group
} */

resource "azurerm_virtual_network_peering" "vnet_peering" {
  name                      = var.name
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.virtual_network_name
  remote_virtual_network_id = var.remote_virtual_network_id
}
