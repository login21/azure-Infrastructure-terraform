variable "resource_group_name" {
  description = "The name of the resource group which will consist of Network flow logs."
  type        = string
}

variable "laws_name" {
  description = "The name of the log analytic workspace to be associated with "
  type        = string
}

variable "name" {
  description = "The name which should be used for this Monitor Azure Active Directory Diagnostic Setting."
  type        = string
}

variable "log" {
  description = ""
  type = list(object({
    category = string
    enabled  = string
    # retention_policy = object({
    #   enabled_retention_policy = string
    #   days    =  string
    # })
  }))
}

variable "log_rentention_enabled" {
  description = "Log rentention for Azure AD Logs is Enabled or Disabled"
  type = bool
}

variable "log_rention_day" {
  description = "The number of days to retain the Azure AD Logs"
  type = number
}