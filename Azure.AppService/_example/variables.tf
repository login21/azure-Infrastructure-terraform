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
# Service Plan variables
# -------------------------------------------------------------
variable "service_plan_name" {
  description = "The name which should be used for this Windows Function App. Changing this forces a new Windows Function App to be created. Limit the function name to 32 characters to avoid naming collisions."
  type        = string
}

variable "os_type" {
  description = "The O/S type for the App Services to be hosted in this plan. Possible values include Windows, Linux, and WindowsContainer. Changing this forces a new resource to be created."
  type        = string
}

variable "sku_name" {
  description = "The SKU for the plan"
  type        = string
}


# -------------------------------------------------------------
# Windows Web Apps variables
# # -------------------------------------------------------------
variable "win_webapp_name" {
  description = "The name which should be used for this Windows Web App."
  type        = map(any)
}


variable "app_site_config" {
  description = "Map of site config settings"
  type        = map(any)
}


variable "app_settings" {
  description = "A map of key-value pairs of App Settings."
  type        = map(any)
  default     = {}
}

variable "connection_strings" {
  description = "The map of the Connection String to connect the database"
  type        = list(map(string))
  default     = []
}

/* variable "virtual_network_subnet_id" {
  description = "The subnet id which will be used by this Web App for regional virtual network integration."
  type        = string
} 
 */

variable "ips_allowed" {
  description = "IPs restriction for App Service to allow specific IP addresses or ranges"
  type        = list(string)
  default     = []
}

variable "subnet_ids_allowed" {
  description = "Allow Specific Subnets for App Service"
  type        = list(string)
  default     = []
}

variable "service_tags_allowed" {
  description = "Restrict Service Tags for App Service"
  type        = list(string)
  default     = []
}

variable "logs" {
  description = "logs setting"
  type = object({
    enable_logging = bool
    detailed_error_messages = bool
    failed_request_tracing  = bool
  })
}

variable "application_logs" {
  description = "application logging"
  type = object({
    level = string   ## The level at which to log. Possible values include Error, Warning, Information, Verbose and Off
    retention_in_days = number    ##The time in days after which to remove blobs
    #sas_url = string     ##SAS url to an Azure blob container with read/write/list/delete permissions.
    file_system_level = string ##Log level. Possible values include: Verbose, Information, Warning, and Error.
  })
}

variable "logcontainer_sas_url" {
  description = "SAS url to an Azure blob container with read/write/list/delete permissions."
  type = string
}

