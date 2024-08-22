# -------------------------------------------------------------
# Resource Group variables
# -------------------------------------------------------------
variable "name" {
  description = "The name of resource group to be created."
  type        = string
}

variable "location" {
  description = "The name of resource group to be created."
  type        = string
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
}

# -------------------------------------------------------------
# Storage account variables
# -------------------------------------------------------------

variable "storage_account_name" {
  description = "The name of the Storage account name"
  type        = string
}

variable "account_tier" {
  description = "The tier to use for the storage account. Values are Standard or Premium "
  type        = string
}

variable "account_replication_type" {
  description = "The type of replication to use for this storage account"
  type        = string
}

variable "account_kind" {
  description = "The Kind of account"
  type        = string
}

variable "public_network_access_enabled" {
  description = "Whether the public network access is enabled?"
  type        = bool
  default     = true
}

variable "min_tls_version" {
  description = "The minimum supported TLS version for the storage account.Possible values are TLS1_0, TLS1_1, and TLS1_2"
  type        = string
  default     = "TLS1_2"
}

variable "sftp_enabled" {
  description = "Boolean, enable SFTP for the storage account."
  type        = bool
  default     = false
}

variable "custom_domain" {
  description = "A custom_domain block."
  type = object({
    name          = string
    use_subdomain = string
  })
  default = null
}

variable "customer_managed_key" {
  description = "A customer_managed_key block. Can only be set when the account_kind is set to StorageV2 or account_tier set to Premium, and the identity type is UserAssigned"
  type = object({
    key_vault_key_id          = string
    user_assigned_identity_id = string
  })
  default = null
}

variable "network_rules" {
  description = "Map of network rules settings"
  type = list(object({
    default_action             = string
    bypass                     = optional(list(string))
    ip_rules                   = optional(list(string))
    virtual_network_subnet_ids = optional(list(string))
    private_link_access        = optional(list(map(string)))
  }))
  default = []
}

variable "blob_properties" {
  description = "Map of network rules settings"
  type = map(object({
    versioning_enabled = optional(bool)
    cors_rule = optional(list(object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(string)
      exposed_headers    = list(string)
      max_age_in_seconds = number
    })))
  }))
  default = null
}

variable "is_hns_enabled" {
  description = "Is Hierarchical Namespace enabled?"
  type = bool
  default = false
}
# -------------------------------------------------------------
# Storage Container variables
# -------------------------------------------------------------

variable "blob_storage_container_name" {
  description = "The name of the storage container name "
  type        = string
}

variable "container_access_type" {
  description = "The access level configured for the container "
  type        = string
}

# -------------------------------------------------------------
# File system variables
# -------------------------------------------------------------

variable "filesystem_name" {
  description = "The name of the Data Lake Gen2 File System which should be created within the Storage Account."
  type        = string
}

variable "properties" {
  description = "A mapping of Key to Base64-Encoded Values which should be assigned to this Data Lake Gen2 File System."
  type        = map(string)
  default     = null
}

variable "ace" {
  description = "One or more ace blocks as defined below to specify the entries for the ACL for the path."
  type = list(object({
    scope       = optional(string)
    type        = string
    permissions = string
  }))
}

variable "owner" {
  description = "Specifies the Object ID of the Azure Active Directory User to make the owning user of the root path"
  type        = string
}

variable "group" {
  description = "Specifies the Object ID of the Azure Active Directory Group to make the owning group of the root path"
  type        = string
}

variable "data_lake_path" {
  description = "Does data lake path need to create?"
  type        = bool
  default     = false
}

variable "path" {
  description = "The path which should be created within the Data Lake Gen2 File System in the Storage Account."
  type        = string
}