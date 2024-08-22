variable "vnet_name" {
  description = "Name of the vnet to create"
  default     = "acctvnet"
}

variable "name" {
  description = "The name of an existing resource group to be imported."
}


variable "location" {
  description = "The name of resource group to be created."
  type        = string
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
      actions = list(string)
    })))
  }))
}


# -------------------------------------------------------------
# NSG variables
# -------------------------------------------------------------


variable "nsg_details" {
  description = " Specifies list of NSGs to be created."
  type = list(object({
    nsg_name           = string
    associated_subnets = set(string)
    security_rules     = list(map(string))
  }))
}


# -------------------------------------------------------------
# Vnet Peering variables
# -------------------------------------------------------------

variable "vnet_peering_name" {
  description = "The name of vnet peering."
  type        = string

}

variable "remote_virtual_network_id" {
  description = "The name of the remote virtual network."
  type        = string

}
# -------------------------------------------------------------
# Bastion variables
# -------------------------------------------------------------

variable "bastion_host_name" {
  description = "Specifies the name of the Bastion Host."
  type        = string
}

variable "public_ip_address_id" {
  description = "Reference to a Public IP Address to associate with this Bastion Host."
  type        = string
}

# -------------------------------------------------------------
# Other variables
# -------------------------------------------------------------

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)

  default = {
    environment = "dev"
  }
}
