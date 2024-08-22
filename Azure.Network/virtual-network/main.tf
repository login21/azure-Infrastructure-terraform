resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = [var.address_space]
  dns_servers         = var.dns_servers
  tags                = var.tags
}


resource "azurerm_subnet" "subnet" {
  for_each = { for subnet in var.subnets : subnet.subnet_name => subnet }

  name                                          = each.value.subnet_name
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = azurerm_virtual_network.vnet.name
  address_prefixes                              = each.value.subnet_address_prefix
  service_endpoints                             = lookup(each.value, "service_endpoints", [])
  service_endpoint_policy_ids                   = lookup(each.value, "service_endpoint_policy_ids", null)
  private_endpoint_network_policies_enabled     = lookup(each.value, "private_endpoint_network_policies_enabled", null)
  private_link_service_network_policies_enabled = lookup(each.value, "private_link_service_network_policies_enabled", null)

  dynamic "delegation" {

        for_each = each.value.delegation == null ? [] : each.value.delegation

        content {
          name = delegation.value.delegation_name

          service_delegation {
            name    =  delegation.value.service_delegation_name
            actions = delegation.value.actions
          }
        
        }
      }

}