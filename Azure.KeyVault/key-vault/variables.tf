variable "resource_group_name" {
  description = "The name of the resource group the Key Vault will be a part of"
  type        = string
}

variable "location" {
  description = "The location of the resource."
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Non-Production Key Vault"
  type        = string
}

variable "sku_name" {
  description = "The sku name used for the Key Vault. Possible values are standard and premium"
  type        = string
}

variable "enabled_for_deployment" {
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."
  type        = bool
  default     = false
}

variable "enabled_for_disk_encryption" {
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
  type        = bool
  default     = false
}

variable "enable_rbac_authorization" {
  description = "Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions."
  type        = bool
  default     = true
}

variable "purge_protection_enabled" {
  description = "Is Purge Protection enabled for this Key Vault? Once Purge Protection has been Enabled it's not possible to Disable it."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for this Key Vault."
  type        = bool
  default     = true
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted"
  type        = number
  default     = 90
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
}

/* variable "ips_allowed" {
  description = "IPs restriction for Key Vault to allow specific IP addresses or ranges"
  type        = list(string)
  default     = []
}

variable "subnet_ids_allowed" {
  description = "Allow Specific Subnets for Key Vault"
  type        = list(string)
  default     = []
} */