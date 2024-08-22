# -------------------------------------------------------------
# Resource Group
# -------------------------------------------------------------
module "resource_group" {
  source = "../../../Azure.ResourceGroup"

  name     = var.name
  location = var.location
  tags     = var.tags
}

# -------------------------------------------------------------
# DES
# -------------------------------------------------------------


module "des" {
  source = "../../disk-encryption-set"
  depends_on = [
    module.resource_group
  ]
  key_vault_name         = var.key_vault_name
  vault_key_name         = var.vault_key_name
  kv_resource_group_name = var.kv_resource_group_name

  name                 = var.des_name
  resource_group_name  = module.resource_group.name
  identity             = var.identity
  key_permissions      = var.key_permissions

}

module "nic" {
  source = "../../../Azure.Network/network-interface"
  depends_on = [
    module.resource_group
  ]

  for_each = var.jumphosts

  name                          = each.value.network_interface_name
  resource_group_name           = module.resource_group.name
  vnet_resource_group_name      = var.vnet_resource_group_name
  enable_ip_forwarding          = each.value.enable_ip_forwarding
  enable_accelerated_networking = each.value.enable_accelerated_networking
  vnet_name                     = var.vnet_name
  subnet_name                   = var.subnet_name
  nic_ip_config_name            = each.value.nic_ip_config_name

  tags = var.tags

}

data "azurerm_key_vault" "kv" {
  name                = "testkv"
  resource_group_name = "testkv-rg"
}

data "azurerm_key_vault_secret" "nonprd_jumphost_password" {
  name         = "nonprod-jumphost-vm-password"
  key_vault_id = data.azurerm_key_vault.kv.id
}

module "windows_vm" {
  source = "../../windows-virtual-machine"
  depends_on = [
    module.resource_group, module.nic
  ]

  for_each = var.jumphosts

  resource_group_name      = module.resource_group.name
  vnet_resource_group_name = var.vnet_resource_group_name
  vnet_name                = var.vnet_name
  subnet_name              = var.subnet_name
  network_interface_id     = module.nic[each.key].id
  disk_encryption_set_id   = module.des.id

  name                   = each.value.virtual_machine_name
  computer_name          = each.value.computer_name
  size                   = each.value.size
  admin_username         = var.admin_username
  admin_password         = data.azurerm_key_vault_secret.nonprd_jumphost_password.value
  timezone               = var.timezone
  os_disk                = each.value.os_disk
  plan                   = each.value.plan
  source_image_reference = each.value.source_image_reference
  identity = var.identity

  tags = var.tags
}
