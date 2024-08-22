variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "mssql_server_name" {
  description = "The name of this Microsoft SQL Server."
  type        = string
}

variable "outbound_fw_rulename" {
  description = "The name of the outbound firewall rule. This should be a FQDN."
  type        = string
}
