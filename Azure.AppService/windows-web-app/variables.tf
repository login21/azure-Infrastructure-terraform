variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "location" {
  description = "The location of the resource."
  type        = string
}


variable "service_plan_id" {
  description = "The id of the service planwhich should be used for this Windows Function App. Changing this forces a new Windows Function App to be created."
  type        = string
}

variable "name" {
  description = "The name which should be used for this Windows Web App. Changing this forces a new Windows Web App to be created."
  type        = string
}

/* variable "site_config" {
  description = "Map of site config settings"
  type = object({
    always_on             = bool,
    api_definition_url    = string,
    api_management_api_id = string
  })
  #default = null
} */

variable "site_config" {
  description = "Map of site config settings"
  type        = map(any)
}

variable "app_settings" {
  description = "A map of key-value pairs of App Settings."
  type        = map(any)
}

variable "connection_strings" {
  description = "Connection strings for App Service"
  type        = list(map(string))
  default     = []
}

variable "https_only" {
  description = "Should the Windows Web App require HTTPS connections."
  type        = bool
  default     = true
}

variable "virtual_network_subnet_id" {
  description = "The subnet id which will be used by this Web App for regional virtual network integration."
  type        = string
  default     = null
} 

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
  default = null
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the Windows Web App."
  type        = map(string)
}

variable "identity_ids" {
  description = "Specifies a list of user managed identity ids to be assigned"
  default     = null
}


#---------------------------------------------------------
# Application Insights variables
#----------------------------------------------------------

variable "application_insights_enabled" {
  description = "Specify the Application Insights use for this App Service"
  default     = true
}

variable "app_insights_name" {
  description = "The Name of the application insights"
  default     = ""
}

variable "application_insights_type" {
  description = "Specifies the type of Application Insights to create. Valid values are `ios` for iOS, `java` for Java web, `MobileCenter` for App Center, `Node.JS` for Node.js, `other` for General, `phone` for Windows Phone, `store` for Windows Store and `web` for ASP.NET."
  default     = "web"
}

variable "retention_in_days" {
  description = "Specifies the retention period in days. Possible values are `30`, `60`, `90`, `120`, `180`, `270`, `365`, `550` or `730`"
  default     = 90
}

variable "disable_ip_masking" {
  description = "By default the real client ip is masked as `0.0.0.0` in the logs. Use this argument to disable masking and log the real client ip"
  default     = false
}

variable "log_analytics_workspace_id" {
  description = "Specifies the id of a log analytics workspace resource."
  default     = null
}