variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "name" {
  description = "The name of the Network Interface."
  type        = string
}

variable "vnet_resource_group_name" {
  description = "The Resource Group Name where vnet exist."
  type        = string
}

variable "vnet_name" {
  description = "Name of the vnet in which this private endpoint will be created."
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet in which this private endpoint will be created."
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

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
}