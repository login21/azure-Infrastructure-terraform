
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
# Network Interface variables 
# -------------------------------------------------------------
variable "network_interface_name" {
  description = "A name used for this Network Interface."
  type        = string
}

variable "enable_ip_forwarding" {
  description = "Should IP Forwarding be enabled?"
  type        = bool
  default     = false
}

variable "enable_accelerated_networking" {
  description = "Should Accelerated Networking be enabled?"
  type        = bool
  default     = false
}

variable "nic_ip_config_name" {
  description = "A name used for this IP Configuration."
  type        = string
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


variable "virtual_machine_name" {
  description = "test"
  type        = string
}

variable "computer_name" {
  description = "Specifies the Hostname which should be used for this Virtual Machine."
  type        = string
}

variable "size" {
  description = "The SKU which should be used for this Virtual Machine, such as Standard_F2."
  type        = string
}

variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine."
  type        = string
}

# variable "admin_password" {
#   description = "The Password which should be used for the local-administrator on this Virtual Machine"
#   type        = string
#   sensitive   = true
# }

variable "timezone" {
  description = "Specifies the Time Zone which should be used by the Virtual Machine"
  type        = string
  default     = null
}

variable "os_disk" {
  description = "The SKU details for the Application Gateway."
  type = object({
    name                 = string
    caching              = string
    storage_account_type = string
    disk_size_gb         = number
  })
}

variable "plan" {
  description = "Contains information of Marketplace Image forthis Virtual Machine"
  type = object({
    name      = string
    product   = string
    publisher = string
  })
}

variable "source_image_reference" {
  description = "Contains information about the image being used to create VM"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}


# -------------------------------------------------------------
# Managed disk variables
# -------------------------------------------------------------
variable "managed_disks" {
  description = "Managed disk configurations"
  type        = map(any)
}

variable "storage_account_type" {
  description = "The type of storage to use for the managed disk."
  type        = string
}

variable "create_option" {
  description = "The method to use when creating the managed disk."
  type        = string
}

variable "data_disk_size_gb" {
  description = "Specifies the size of the managed disk to create in gigabytes."
  type        = number
}

variable "lun" {
  description = "he Logical Unit Number of the Data Disk, which needs to be unique within the Virtual Machine."
  type        = string
  default     = "10"
}

variable "caching" {
  description = "Specifies the caching requirements for this Data Disk. Possible values include None, ReadOnly and ReadWrite"
  type        = string
  default     = "ReadWrite"
}

variable "disk_attachement_create_option" {
  description = "The Create Option of the Data Disk, such as Empty or Attach."
  type        = string
  default     = "Attach"
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

# variable "role_definition_name" {
#   description = "Specifies the name of the role"
#   type        = string
# }
