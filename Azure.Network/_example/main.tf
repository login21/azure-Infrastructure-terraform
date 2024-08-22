# -------------------------------------------------------------
# Resource Group
# -------------------------------------------------------------
module "resource_group" {
  source = "../../Azure.ResourceGroup"
  name     = var.name
  location = var.location
  tags     = var.tags
}

# -------------------------------------------------------------
# Virtual Network
# -------------------------------------------------------------

module "virtual_network" {
  source = "../virtual-network"

  depends_on = [
  module.resource_group]

  vnet_name           = var.vnet_name
  resource_group_name = module.resource_group.name
  address_space       = var.address_space
  subnets             = var.subnets
  tags                = var.tags
}


# -------------------------------------------------------------
# NSG
# -------------------------------------------------------------

module "nsg" {
  source = "../network-security-group"

  depends_on = [module.virtual_network]

  for_each = { for nsg in var.nsg_details : nsg.nsg_name => nsg }



  nsg_name            = each.value.nsg_name
  resource_group_name = module.resource_group.name
  vnet_name           = var.vnet_name
  subnet_names        = each.value.associated_subnets
  security_rules      = each.value.security_rules
  tags                = var.tags


}

# -------------------------------------------------------------
# Vnet Peering with Common Account Vnet
# -------------------------------------------------------------


module "vnet_peering" {
  source = "../vnet-peering"

  depends_on = [module.virtual_network]

  name                 = var.vnet_peering_name
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.virtual_network.name

  remote_virtual_network_id  = var.remote_virtual_network_id

}


# -------------------------------------------------------------
# Bastion host
# -------------------------------------------------------------
module "bastion_host" {

  source = "../bastion-host"

  depends_on = [module.resource_group, module.virtual_network]

  bastion_host_name   = var.bastion_host_name
  resource_group_name  = module.resource_group.name
  sku                 = "Basic"
  copy_paste_enabled  = true
  file_copy_enabled   = true
  scale_units         = 2
  #shareable_link_enabled = var.shareable_link_enabled  ##supported for standard sku


  bastion_subnet_id = "test_subnet"
  ip_configuration_name = "test-ip-config"
  public_ip_address_id = var.public_ip_address_id
  

  tags = var.tags

}

# -------------------------------------------------------------
# Private Endpoint
# -------------------------------------------------------------

module "parivate_endpoint" {

  source = "../private-endpoint"

  depends_on = [module.resource_group, module.virtual_network]

  resource_group_name  = module.resource_group.name
  vnet_name = var.vnet_name
  subnet_name = "data-subnet"
  private_endpoint_name = "test-endpoint"
  private_service_connection_name = "test-service-conn"
  private_connection_resource_id = "/subscriptions/id/resourceGroups/rg-name/providers/Microsoft.KeyVault/vaults/testkv"

}