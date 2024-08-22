resource "azurerm_bastion_host" "bastion_host" {
  name                = var.bastion_host_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  copy_paste_enabled  = var.copy_paste_enabled
  file_copy_enabled   = var.file_copy_enabled
  scale_units         = var.scale_units
  #shareable_link_enabled = var.shareable_link_enabled  ##supported for standard sku

  ip_configuration {
    name                 = var.ip_configuration_name
    subnet_id            = var.bastion_subnet_id
    public_ip_address_id = var.public_ip_address_id
  }

  tags = var.tags
}
