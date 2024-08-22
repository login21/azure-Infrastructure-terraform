variable "resource_group_name" {
  description = "The name of the Resource Group where the Data Collection Rule should exist. Changing this forces a new Data Collection Rule to be created."
  type        = string
}

variable "laws_name" {
  description = "Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol. Changing this forces a new resource to be created."
  type        = string
}


variable "name" {
  description = "The name which should be used for this Data Collection Rule. Changing this forces a new Data Collection Rule to be created."
  type        = string
}

# variable "destinations" {
#   description = "Destination of the logs"
#   type = list(object({
#     log_analytics = object({
#       # workspace_resource_id = string
#       name = string
#     })
#   }))
# }
# variable "destinations" {
#   description = "Destination of the logs"
#   type = object({
#     log_analytics = object({
#       # workspace_resource_id = string
#       name = string
#     })
#   })
# }

# variable "la_destinations_name" {
#   type = string

# }

variable "data_flow" {
  description = "The destination and streams for the logs"
  type = object({
    streams      = list(string)
    destinations = list(string)
  })
}

# variable "data_sources" {
#   description = "Web Application Firewall support for your Azure Application Gateway"
#   type = object({
#     windows_event_logs = object({
#       streams        = list(string)
#       x_path_queries = list(string)
#       name           = string
#     })
#   })
# }

variable "la_destination_name" {
  description = "The name of the Log Analytics destination."
  type        = string
}

variable "streams" {
  description = "The streams for the data flow and data sources."
  type        = list(string)
}

variable "x_path_queries" {
  description = "The XPath queries for the Windows Event Log data source."
  type        = list(string)
}

variable "windows_event_log_data_source_name" {
  description = "The name of the Windows Event Log data source."
  type        = string
}

