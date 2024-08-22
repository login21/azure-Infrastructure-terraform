# -------------------------------
# Resource Group variables
# -------------------------------
name     = "rg-test-01"
location = "australiaeast"
tags = {
  environment = "",
  project     = "test"
}

# -------------------------------
# DES
# -------------------------------
key_vault_name         = "testkv"
vault_key_name         = "testkvkey"
kv_resource_group_name = "testkvrg"
des_name               = "des-test-01"
identity = {
  type = "SystemAssigned"
}
key_permissions = ["Get", "WrapKey", "UnwrapKey", ]
# role_definition_name = "Reader"

# -------------------------------
# VM vars
# -------------------------------

vnet_name                = "vnet-testcore-syd-01"
vnet_resource_group_name = "rg-test-syd-01-vnet"
subnet_name              = "ApplicationSubnet"
network_interface_name   = "nic-test-syd-01-vm"
nic_ip_config_name       = "ipconfig-test-syd-01-vm"

virtual_machine_name = "vm-test-syd-01-"
computer_name        = "test-computer"
size                 = "Standard_E8as_v5"
admin_username       = "admin"
timezone             = "AUS Eastern Standard Time"

os_disk = {
  name                 = "osdisk-test-syd-01-001"
  caching              = "ReadWrite"
  storage_account_type = "Premium_LRS"
  disk_size_gb         = 50
}

plan = {
  name      = "cis-ws2019-l2"
  product   = "cis-windows-server-2019-v1-0-0-l2"
  publisher = "center-for-internet-security-inc"
}
source_image_reference = {
  publisher = "center-for-internet-security-inc"
  offer     = "cis-windows-server-2019-v1-0-0-l2"
  sku       = "cis-ws2019-l2"
  version   = "latest"
}

# -------------------------------
# Managed disks
# -------------------------------
managed_disks = {
  disk- = {
    name = "disk-test-syd-01-001"
    tier = "P15"
  }
}
storage_account_type = "Premium_LRS"
create_option        = "Empty"
data_disk_size_gb    = 10
