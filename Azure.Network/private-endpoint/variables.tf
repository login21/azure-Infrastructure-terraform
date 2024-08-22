variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "vnet_resource_group_name" {
  description = "The Name which should be used for this Resource Group."
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

variable "private_dns_zone_name" {
  description = "The name of the Private DNS Zone. Must be a valid domain name. Changing this forces a new resource to be created."
  type        = string
}

variable "private_dns_zone_rg" {
  description = "The name of the Resource group where Private DNS Zone exist."
  type        = string
}


variable "name" {
  description = "Specifies the name of the Private endpoint."
  type        = string
}

variable "custom_network_interface_name" {
  description = "The custom name of the network interface attached to the private endpoint."
  type        = string
}

variable "private_dns_zone_group_name" {
  description = "Specifies the Name of the Private DNS Zone Group."
  type        = string
}

# variable "private_dns_zone_ids" {
#   description = "Specifies the list of Private DNS Zones to include within the private_dns_zone_group"
#   type        = list(any)

# }
variable "private_service_connection_name" {
  description = "Specifies the name of the Private service connection."
  type        = string
}

variable "private_connection_resource_id" {
  description = "The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to."
  type        = string
}

variable "subresource_names" {
  description = "A list of subresource names which the Private Endpoint is able to connect to. subresource_names corresponds to group_id."
  type        = list(string)
}
