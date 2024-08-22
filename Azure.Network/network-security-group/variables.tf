variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "location" {
  description = "Location where this resource will be created."
  type = string
  default = "australiaeast"
}

variable "nsg_name" {
  description = " Specifies the name of the network security group."
  type        = string

}


variable "vnet_name" {
  description = " Specifies the name of the vnet."
  type        = string

}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  type        = set(string)
  default     = ["subnet1", "subnet2", "subnet3"]
}

variable "security_rules" {
  description = "Connection strings for App Service"
  type        = list(map(string))
  default     = []
}


variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
}
