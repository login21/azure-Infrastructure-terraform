variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "vnet_resource_group_name" {
  description = "The Resource Group Name where vnet exist."
  type        = string
}

variable "vnet_name" {
  description = "Specifies the name of the vnet."
  type        = string
}

variable "subnet_name" {
  description = "A list of public subnets inside the vNet."
  type        = string
}

variable "network_interface_id" {
  description = "Specifies the Id of the Network Interface."
  type        = string
}

variable "disk_encryption_set_id" {
  description = "The name of the Disk Encryption Set."
  type        = string
}

variable "name" {
  description = "The name of the Windows Virtual Machine."
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

variable "admin_password" {
  description = "The Password which should be used for the local-administrator on this Virtual Machine"
  type        = string
}

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
  description = "Contains information of Marketplace Image for this Virtual Machine"
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

variable "identity" {
  description = "Specifies the type of Managed Service Identity that should be configured on this Windows Virtual Machine. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both)."
  type = object({
    type = string
  })
}

variable "tags" {
  description = "A mapping of tags which should be assigned to this Virtual Machine."
  type        = map(string)
}

variable "enable_boot_diagnostics" {
  description = "Should the boot diagnostics enabled?"
  default     = false
}

variable "boot_diagnostics_storage_account_uri" {
  description = "he Primary/Secondary Endpoint for the Azure Storage Account which should be used to store Boot Diagnostics."
  type        = string
  default     = null
}
