variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "mssql_server_name" {
  description = "The name of this Microsoft SQL Server."
  type        = string
}

variable "fw_rule_name" {
  description = "The name of the firewall rule. Changing this forces a new resource to be created."
  type        = string
}

variable "start_ip_address" {
  description = "The starting IP address to allow through the firewall for this rule."
  type        = string
}

variable "end_ip_address" {
  description = "The ending IP address to allow through the firewall for this rule."
  type        = string
}
