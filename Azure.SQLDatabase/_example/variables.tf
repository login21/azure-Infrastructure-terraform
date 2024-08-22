# -------------------------------------------------------------
# Resource Group variables
# -------------------------------------------------------------
variable "name" {
  description = "The name of resource group to be created."
  type        = string
}

variable "location" {
  description = "The name of resource group to be created."
  type        = string
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
}

# -------------------------------------------------------------
# MS SQL Server variables
# -------------------------------------------------------------
variable "mssql_server_name" {
  description = "The name of the Microsoft SQL Server."
  type        = string
}

variable "sql_version" {
  description = "The version for the new server."
  type        = string
}

variable "administrator_login" {
  description = "The administrator login name for the new server."
  type        = string
}

variable "administrator_login_password" {
  description = "The password associated with the administrator_login"
  type        = string
}

variable "connection_policy" {
  description = "The connection policy the server will use. Possible values are Default, Proxy, and Redirect. Defaults to Default."
  type        = string
  default     = "Default"
}

variable "identity" {
  description = "Specifies the type of Managed Service Identity that should be configured on this SQL Server. Possible values are SystemAssigned, UserAssigned."
  type = object({
    type = string
  })
}

# -------------------------------------------------------------
# MS SQL Database variables
# -------------------------------------------------------------
variable "mssql_dbname" {
  description = "The name of the MS SQL Database."
  type        = map(any)
}


variable "auto_pause_delay_in_minutes" {
  description = "Time in minutes after which database is automatically paused. A value of -1 means that automatic pause is disabled. This property is only settable for General Purpose Serverless databases."
  type        = number

}

variable "create_mode" {
  description = "The create mode of the database."
  type        = string
  default     = "Default"
}

variable "max_size_gb" {
  description = "The max size of the database in gigabytes."
  type        = number
}

variable "sku_name" {
  description = "Specifies the name of the SKU used by the database."
  type        = string
}

variable "min_capacity" {
  description = " Minimal capacity that database will always have allocated, if not paused. This property is only settable for General Purpose Serverless databases."
  type        = number
}

variable "storage_account_type" {
  description = "Specifies the storage account type used to store backups for this database. Possible values are Geo, Local and Zone. The default value is Geo."
  type        = string
  default     = "Geo"
}
    

variable "elastic_pool_id" {
  description = "Specifies the ID of the elastic pool containing this database."
  type        = string
  default     = null
}

variable "zone_redundant" {
  description = "Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones."
  type        = bool
  default     = false
}

# -------------------------------------------------------------
# MS SQL Elasticpool variables
# -------------------------------------------------------------
variable "mssql_elasticpool_name" {
  description = "The name of the elastic pool."
  type        = map(any)
}

variable "ep_max_size_gb" {
  description = "The max data size of the elastic pool in gigabytes."
  type        = number
}

variable "sku" {
  description = "The SKU details for the Elastic pool."
  type        = map(any)
}

variable "per_database_settings" {
  description = "The databae capaticity settings."
  type        = map(any)
}
