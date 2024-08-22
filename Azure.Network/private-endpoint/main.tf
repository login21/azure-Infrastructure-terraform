data "azurerm_resource_group" "vnet_rg" {
  name = var.vnet_resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.vnet_rg.name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.vnet_rg.name
}

data "azurerm_private_dns_zone" "private_dns_zone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.private_dns_zone_rg
}

resource "azurerm_private_endpoint" "private_endpoint" {
  name                          = var.name
  location                      = data.azurerm_resource_group.vnet_rg.location
  resource_group_name           = var.resource_group_name
  subnet_id                     = data.azurerm_subnet.subnet.id
  custom_network_interface_name = var.custom_network_interface_name

  private_dns_zone_group {
    name                 = var.private_dns_zone_group_name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.private_dns_zone.id]
  }

  private_service_connection {
    name                           = var.private_service_connection_name
    private_connection_resource_id = var.private_connection_resource_id
    is_manual_connection           = false
    subresource_names              = var.subresource_names
  }

  lifecycle {
    ignore_changes = [
      location,
      subnet_id
    ]
  }
}
