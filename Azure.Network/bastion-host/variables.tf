variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "location" {
  description = "Location where this resource will be created."
  type = string
  default = "australiaeast"
}


variable "bastion_subnet_id" {
  description = "ID of the subnet in which this Bastion Host will be created."
  type = string
}


variable "bastion_host_name" {
  description = "Specifies the name of the Bastion Host."
  type        = string
}

variable "sku" {
  description = "The SKU of the Bastion Host. Accepted values are Basic and Standard."
  type        = string
  default     = "Basic"
}

variable "scale_units" {
  description = "The number of scale units with which to provision the Bastion Host."
  type        = number
  default     = 2
}

variable "copy_paste_enabled" {
  description = "Is Copy/Paste feature enabled for the Bastion Host."
  type        = bool
  default     = true
}

variable "file_copy_enabled" {
  description = "Is File Copy feature enabled for the Bastion Host. Only supported when sku is Standard"
  type        = bool
  default     = true
}

variable "ip_configuration_name" {
  description = "The name of the IP configuration."
  type        = string
}

variable "public_ip_address_id" {
  description = "Reference to a Public IP Address to associate with this Bastion Host."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
}
