variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "location" {
  description = "Location where this resource will be created."
  type = string
  default = "australiaeast"
}

variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "allocation_method" {
  description = " Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  type        = string
  default     = "Static"
}

variable "sku" {
  description = "The SKU of the Public IP. Accepted values are Basic and Standard"
  type        = string
  default     = "Basic"
}

variable "sku_tier" {
  description = "The SKU Tier that should be used for the Public IP. Possible values are Regional and Global"
  type        = string
  default     = "Regional"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
}
