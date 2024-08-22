variable "resource_group_name" {
  description = "The name of the resource group for the Blob Storage will be a part of"
  type        = string
}

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
  default = {}
}

variable "is_hns_enabled" {
  description = "Is Hierarchical Namespace enabled?"
  type = bool
  default = false
}

variable "enable_https_traffic_only" {
  description = "Boolean flag which forces HTTPS if enabled, see here for more information"
  type = bool
  default = true
  
}