data "azurerm_subnet" "subnet" {
  for_each = var.subnet_names

  name = each.value

  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

#-----------------------------------------------
# Network security group - Default is "false"
#-----------------------------------------------
resource "azurerm_network_security_group" "nsg" {

  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  dynamic "security_rule" {

    for_each = var.security_rules

    content {
      name                       = lookup(security_rule.value, "name", "Default_Rule")
      priority                   = lookup(security_rule.value, "priority", 100)
      direction                  = lookup(security_rule.value, "direction", "Inbound")
      access                     = lookup(security_rule.value, "access", "Allow")
      protocol                   = lookup(security_rule.value, "protocol", "Tcp")
      source_port_range          = lookup(security_rule.value, "source_port_range", "*")
      destination_port_range     = lookup(security_rule.value, "destination_port_range", "*")
      source_address_prefix      = lookup(security_rule.value, "source_address_prefix", "*")
      destination_address_prefix = lookup(security_rule.value, "destination_address_prefix", "*")
      description                = lookup(security_rule.value, "description", null)
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg-assoc" {

  for_each = data.azurerm_subnet.subnet

  subnet_id                 = data.azurerm_subnet.subnet[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg.id

} 