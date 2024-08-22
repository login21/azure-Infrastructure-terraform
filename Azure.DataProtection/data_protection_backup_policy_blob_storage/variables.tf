variable "resource_group_name" {
  description = "The name of the Resource Group where the Backup Vault should exist."
  type        = string
}

variable "backup_vault_id" {
  description = "Specifies the id of the Backup Vault."
  type        = string
}

variable "name" {
  description = "The name which should be used for this Backup Policy Blob Storage."
  type        = string
}

variable "retention_duration" {
  description = "Duration of deletion after given timespan. It should follow ISO 8601 duration format."
  type        = string
}
