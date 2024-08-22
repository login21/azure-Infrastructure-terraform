variable "resource_group_name" {
  description = "Specifies the name of the Resource Group where the Security Insights Sentinel Onboarding States should exist."
  type        = string
}

variable "laws_name" {
  description = "Specifies the name of the Log Analytics Workspace."
  type        = string
}

variable "customer_managed_key_enabled" {
  description = "Specifies if the Workspace is using Customer managed key."
  type        = bool
  default     = false
}