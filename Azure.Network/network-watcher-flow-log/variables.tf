variable "resource_group_name" {
  description = "The name of the resource group which will consist of Network flow logs."
  type        = string
}

variable "laws_name" {
  description = "The name of the log analytic workspace to be associated with "
  type        = string
}

variable "laws_rg_name" {
  description = "The name of the resource group in which log analytic workspace to deployed."
  type        = string
}

variable "network_watcher_name" {
  description = "The name of the Network Watcher."
  type        = string
}

variable "name" {
  description = "The name of the Network Watcher Flow Log."
  type        = string
}

variable "nw_version" {
  description = "The version (revision) of the flow log. Possible values are 1 and 2."
  type        = number
}

variable "network_security_group_id" {
  description = "The ID of the Network Security Group for which to enable flow logs for."
  type        = string
}

variable "storage_account_id" {
  description = "The ID of the Storage Account where flow logs are stored."
  type        = string
}

variable "enabled" {
  description = "Should Network Flow Logging be Enabled?"
  type        = bool
  default     = false
}

variable "retention_policy" {
  description = "Consists of Boolean flag to enable/disable retention and the number of days to retain flow log records."
  type = object({
    enabled = bool
    days    = number
  })
}

variable "traffic_analytics" {
  description = "Consists of boolean flag to enable/disable traffic analytics and workspace related details."
  type = object({
    enabled             = bool
    interval_in_minutes = number
  })
}

variable "tags" {
  description = " A mapping of tags which should be assigned to the Network Watcher Flow Log."
  type        = map(string)
}
