
variable "resource_group_name" {
  description = "The name of resource group where this resource will be created."
  type = string
}

variable "location" {
  description = "Location where this resource will be created."
  type = string
  default = "australiaeast"
}

variable "vnet_name" {
  description = "Name of the vnet to create"
  type = string
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = "10.0.0.0/16"
}

# If no values specified, this defaults to Azure DNS 
variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  type        = list(string)
  default     = []
}


variable "subnets" {
  description = "For each subnet, create an object that contain fields"
  type = list(object({
    subnet_name           = string,
    subnet_address_prefix = list(string),
    service_endpoints     = list(string),
    delegation = optional(list(object({
      delegation_name = string
      service_delegation_name = string
      actions = optional(list(string))
    })))

  }))
}


variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)

  default = {
    environment = "dev"
  }
}
