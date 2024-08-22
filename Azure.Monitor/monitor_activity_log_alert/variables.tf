variable "resource_group_name" {
  description = "The name of the resource group in which to create the activity log alert instance."
  type        = string
}

variable "laws_name" {
  description = "Specifies the name of the Log Analytics Workspace."
  type        = string
}

variable "name" {
  description = "The name of the activity log alert."
  type        = string
}

variable "scopes" {
  description = "The Scope at which the Activity Log should be applied. A list of strings which could be a resource group , or a subscription, or a resource ID (such as a Storage Account)."
  type        = list(string)
}

variable "description" {
  description = "The description of this activity log alert."
  type        = string
}

variable "enabled" {
  description = "Should this Activity Log Alert be enabled? Defaults to true."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}

variable "criteria" {
  description = ""
  type = object({
    category = string
  })
}