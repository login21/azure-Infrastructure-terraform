
# -------------------------------------------------------------
# Resource Group variables
# -------------------------------------------------------------
variable "name" {
  description = "The name of resource group to be created."
  type        = string
}

variable "location" {
  description = "The name of resource group to be created."
  type        = string
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
}

# -------------------------------------------------------------
# VM variables
# -------------------------------------------------------------
variable "vnet_name" {
  description = "Specifies the name of the vnet."
  type        = string
}

variable "vnet_resource_group_name" {
  description = "Specifies the name of the VNET Resource Group."
  type        = string
}

variable "subnet_name" {
  description = "A list of public subnets inside the vNet."
  type        = string
}

variable "timezone" {
  description = "Specifies the Time Zone which should be used by the Virtual Machine"
  type        = string
  default     = null
}

variable "jumphosts" {
  description = "value"
  type = map(object({
    virtual_machine_name = string
    computer_name        = string
    size                 = string
    os_disk = object({
      name                 = string
      caching              = string
      storage_account_type = string
      disk_size_gb         = number
    })
    plan = object({
      name      = string
      product   = string
      publisher = string
    })
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    network_interface_name        = string
    enable_ip_forwarding          = bool
    enable_accelerated_networking = bool
    nic_ip_config_name            = string

  }))
}

variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine."
  type        = string

}

# -------------------------------------------------------------
# Disk Encryption Set variables
# -------------------------------------------------------------
variable "key_vault_name" {
  description = "Specifies the name of the Key Vault."
  type        = string
}

variable "vault_key_name" {
  description = "Specifies the name of the Key Vault Key."
  type        = string
}

variable "kv_resource_group_name" {
  description = "Specifies the name of the Key Vault Resource Group."
  type        = string
}

variable "des_name" {
  description = "The name of the Disk Encryption Set."
  type        = string
}

variable "identity" {
  description = "The type of Managed Service Identity that is configured on this Disk Encryption Set."
  type = object({
    type = string
  })
}

variable "key_permissions" {
  description = "Specifies key permissions."
  type        = list(string)
}

variable "role_definition_name" {
  description = "Specifies the name of the role"
  type        = string
}


