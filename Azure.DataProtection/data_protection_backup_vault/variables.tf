variable "resource_group_name" {
  description = "The name of the Resource Group where the Backup Vault should exist."
  type        = string
}

variable "location" {
  description = "The location of the resource."
  type        = string
}

variable "name" {
  description = "Specifies the name of the Backup Vault."
  type        = string
}

variable "datastore_type" {
  description = "Specifies the type of the data store. Possible values are ArchiveStore, SnapshotStore and VaultStore."
  type        = string
}

variable "redundancy" {
  description = "Specifies the backup storage redundancy. Possible values are GeoRedundant and LocallyRedundant."
  type        = string
}

variable "identity" {
  description = "Specifies the type of Managed Service Identity that should be configured on this Backup Vault."
  type = object({
    type = string
  })
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the Backup Vault."
  type        = map(string)
}