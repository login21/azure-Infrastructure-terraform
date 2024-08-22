variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "location" {
  description = "The location of the resource."
  type        = string
}


variable "name" {
  description = "The name which should be used for this Windows Function App. Changing this forces a new Windows Function App to be created. Limit the function name to 32 characters to avoid naming collisions."
  type        = string
}

# variable "location" {
#   description ="The Azure Region where the Service Plan should exist. Changing this forces a new AppService to be created."
#   type      = string
# }

variable "os_type" {
  description = "The O/S type for the App Services to be hosted in this plan. Possible values include Windows, Linux, and WindowsContainer. Changing this forces a new resource to be created."
  type        = string
}

variable "sku_name" {
  description = "The SKU for the plan"
  type        = string
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the AppService."
  type        = map(any)
}
