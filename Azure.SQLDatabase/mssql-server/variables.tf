variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "location" {
  description = "The location of the resource."
  type        = string
}


variable "mssql_server_name" {
  description = "The name of the Microsoft SQL Server. This needs to be globally unique within Azure. Changing this forces a new resource to be created."
  type        = string
}

variable "sql_version" {
  description = "The version for the new server."
  type        = string
  default     = "12.0"
}

variable "administrator_login" {
  description = "The administrator login name for the new server."
  type        = string
}

variable "administrator_login_password" {
  description = "The password associated with the administrator_login"
  type        = string
}

variable "identity" {
  description = "Specifies the type of Managed Service Identity that should be configured on this SQL Server. Possible values are SystemAssigned, UserAssigned."
  type = object({
    type = string
  })
}

variable "connection_policy" {
  description = "The connection policy the server will use. Possible values are Default, Proxy, and Redirect. Defaults to Default."
  type        = string
}

variable "public_network_access_enabled" {
  description = "hether public network access is allowed for this server. Defaults to true."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}

variable "azuread_administrator" {
  description = "An azuread_administrator block."
  type = object({
    login_username = string
    object_id = string
  })
  default = null
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
