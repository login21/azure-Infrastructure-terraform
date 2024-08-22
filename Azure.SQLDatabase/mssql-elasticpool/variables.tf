variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "location" {
  description = "The location for resource to be created."
  type        = string
}

variable "mssql_server_name" {
  description = "The name of this Microsoft SQL Server."
  type        = string
}

variable "name" {
  description = "The name of the elastic pool."
  type        = string
}

variable "max_size_gb" {
  description = "The max data size of the elastic pool in gigabytes."
  type        = string
}

variable "sku" {
  description = "The SKU details for the Elastic pool."
  type        = map(any)
}

variable "per_database_settings" {
  description = "The databae capaticity settings."
  type        = map(any)
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}

variable "timeouts" {
  default = {
    create = "60m"
    delete = "60m"
    read   = "5m"
    update = "60m"
  }

  description = "Timeout settings."
  type        = map(string)
}
