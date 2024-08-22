variable "resource_group_name" {
  description = "The name of the resource group in which to create the Recovery Services Vault."
  type        = string
}

variable "recovery_vault_name" {
  description = "Specifies the name of the Recovery Services Vault. Recovery Service Vault name must be 2 - 50 characters long, start with a letter, contain only letters, numbers and hyphens. Changing this forces a new resource to be created."
  type        = string
}

variable "name" {
  description = "Specifies the name of the Backup Policy. Changing this forces a new resource to be created."
  type        = string
}

variable "timezone" {
  description = "Specifies the timezone. the possible values are defined here. Defaults to UTC"
  type        = string
}

variable "backup" {
  description = "Configures the Policy backup frequency, times & days."
  type = object({
    frequency = string
    time      = string
  })
}

variable "retention_daily" {
  description = "Configures the Policy backup frequency, times & days."
  type = object({
    count = number
  })
}

variable "retention_weekly" {
  description = "Configures the policy weekly retention"
  type = object({
    count    = number
    weekdays = list(string)
  })
}