variable "laws_id" {
  description = "Specifies the ID of the Log Analytics Workspace."
  type        = string
}

variable "name" {
  description = "Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created."
  type        = string
}

variable "target_resource_id" {
  description = "The ID of an existing Resource on which to configure Diagnostic Settings. Changing this forces a new resource to be created."
  type        = string
}

variable "enabled_log" {
  description = ""
  type = list(object({
    category = string
  }))
}

variable "log_enabled" {
  description = "Is this Diagnostic Metric enabled?"
  type        = bool
  default     = true
}

variable "log_days" {
  description = "The number of days for which this Retention Policy should apply."
  type        = number
}

variable "metric" {
  description = ""
  type = list(object({
    category = string
  }))
}

variable "retention_policy_enabled" {
  description = "Is this Retention Policy enabled?"
  type        = bool
}

variable "retention_policy_days" {
  description = "The number of days for which this Retention Policy should apply."
  type        = number
}