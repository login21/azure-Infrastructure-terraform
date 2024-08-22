# -------------------------------------------------------------
# Resource Group variables
# -------------------------------------------------------------
name     = "rg-test-vm"
location = "australiaeast"
tags = {
  environment = "cmn",
  project     = "test"
}

# -------------------------------------------------------------
# DES
# -------------------------------------------------------------
key_vault_name         = "testkv"
vault_key_name         = "test-vm-encyrption-key"
kv_resource_group_name = "rg-test-01-keyvault"
des_name               = "des-np-01"
identity = {
  type = "SystemAssigned"
}
key_permissions      = ["Get", "WrapKey", "UnwrapKey", ]
role_definition_name = "Reader"

# -------------------------------------------------------------
# VM vars
# -------------------------------------------------------------

vnet_resource_group_name = "rg-cmn-01-vnet"
vnet_name                = "vnet-test-01"
subnet_name              = "PublicSubnetCommon"
admin_username           = "admin"
timezone                 = "AUS Eastern Standard Time"

jumphosts = {
  vm1 = {
    computer_name                 = "np-vm01"
    enable_accelerated_networking = false
    enable_ip_forwarding          = false
    network_interface_name        = "nic-test-01-vm"
    nic_ip_config_name            = "test-01-vm"
    os_disk = {
      name                 = "osdisk-test-01-vm"
      caching              = "ReadWrite"
      disk_size_gb         = 30
      storage_account_type = "Premium_LRS"
    }
    plan = {
      name      = "cis-ws2019-l2"
      product   = "cis-windows-server-2019-v1-0-0-l2"
      publisher = "center-for-internet-security-inc"
    }
    size = "Standard_B4ms"
    source_image_reference = {
      publisher = "center-for-internet-security-inc"
      offer     = "cis-windows-server-2019-v1-0-0-l2"
      sku       = "cis-ws2019-l2"
      version   = "latest"
    }
    virtual_machine_name = "vm-test-01-vm"
  }
}


