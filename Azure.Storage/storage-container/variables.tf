variable "resource_group_name" {
  description = "The name of the resource group for the Blob Storage will be a part of"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Storage account name"
  type        = string
}

variable "blob_storage_container_name" {
  description = "The name of the storage container name "
  type        = string
}

variable "container_access_type" {
  description = "The Access level configured for the container"
  type        = string
}