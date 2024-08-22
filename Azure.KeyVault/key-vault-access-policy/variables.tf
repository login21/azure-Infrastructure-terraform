variable "key_vault_name" {
  description = "The name of the Key Vault Non-Prod Environment"
  type        = string
}

variable "key_permissions" {
  description = "The List of the key permissions"
  type        = list(any)
}

variable "secret_permissions" {
  description = "The List of secret permissions"
  type        = list(any)
}

variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}


variable "service_principal_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}
