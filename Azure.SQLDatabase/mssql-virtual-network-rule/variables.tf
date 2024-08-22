variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "mssql_server_name" {
  description = "The name of this Microsoft SQL Server."
  type        = string
}

variable "db_vnet_rule_name" {
  description = "The name of the SQL virtual network rule."
  type        = string
}
