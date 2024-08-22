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

  name                = var.des_name
  resource_group_name = module.resource_group.name
  identity            = var.identity
  key_permissions     = var.key_permissions
  # role_definition_name = var.role_definition_name

}

module "nic" {
  source = "../../../Azure.Network/network-interface"
  depends_on = [
    module.resource_group
  ]

  name                          = var.network_interface_name
  resource_group_name           = module.resource_group.name
  vnet_resource_group_name      = var.vnet_resource_group_name
  enable_ip_forwarding          = var.enable_ip_forwarding
  enable_accelerated_networking = var.enable_accelerated_networking
  vnet_name                     = var.vnet_name
  subnet_name                   = var.subnet_name
  nic_ip_config_name            = var.nic_ip_config_name

  tags = var.tags

}

data "azurerm_key_vault" "kv" {
  name                = "kvnqaitscorenpsyd01cmk"
  resource_group_name = "rg-nqaits-nonprod-syd-01-keyvault"
}

data "azurerm_key_vault_secret" "vm_password" {
  name         = "nonprod-smartflow-vm"
  key_vault_id = data.azurerm_key_vault.kv.id
}

module "windows_vm" {
  source = "../../windows-virtual-machine"
  depends_on = [
    module.resource_group, module.nic, module.des
  ]

  resource_group_name      = module.resource_group.name
  vnet_resource_group_name = var.vnet_resource_group_name
  vnet_name                = var.vnet_name
  subnet_name              = var.subnet_name
  network_interface_id     = module.nic.id
  disk_encryption_set_id   = module.des.id

  name                   = var.virtual_machine_name
  computer_name          = var.computer_name
  size                   = var.size
  admin_username         = var.admin_username
  admin_password         = data.azurerm_key_vault_secret.vm_password.value
  timezone               = var.timezone
  os_disk                = var.os_disk
  plan                   = var.plan
  source_image_reference = var.source_image_reference
  tags                   = var.tags
  identity =  var.identity
}


module "managed_disk" {
  source = "../../managed-disk"
  depends_on = [
    module.resource_group, module.windows_vm
  ]

  disk_encryption_set_id = module.des.id

  for_each             = var.managed_disks
  name                 = each.value.name
  resource_group_name  = module.resource_group.name
  location = var.location
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  data_disk_size_gb    = var.data_disk_size_gb
  tier                 = each.value.tier
  tags                 = var.tags

  virtual_machine_id = module.windows_vm.id
}


