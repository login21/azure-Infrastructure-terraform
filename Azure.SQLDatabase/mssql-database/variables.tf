variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "mssql_server_id" {
  description = "The id of this Microsoft SQL Server."
  type        = string
}

variable "mssql_dbname" {
  description = "The name of the MS SQL Database."
  type        = string
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

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
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

