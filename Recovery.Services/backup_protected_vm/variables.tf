variable "resource_group_name" {
  description = "The name of the resource group in which to create the Recovery Services Vault."
  type        = string
}

variable "recovery_vault_name" {
  description = "Specifies the name of the Recovery Services Vault to use."
  type        = string
}

variable "vm_backup_policy_name" {
  description = "Specifies the name of the Backup Policy."
  type        = string
}

variable "source_vm_id" {
  description = " Specifies the ID of the VM to backup."
  type        = string
}