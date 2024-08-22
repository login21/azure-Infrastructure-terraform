variable "resource_group_name" {
  description = "The name of the resource group in which to create the Recovery Services Vault."
  type        = string
}

variable "name" {
  description = "Specifies the name of the Recovery Services Vault. Recovery Service Vault name must be 2 - 50 characters long, start with a letter, contain only letters, numbers and hyphens. Changing this forces a new resource to be created."
  type        = string
}

variable "sku" {
  description = "Sets the vault's SKU. Possible values include: Standard, RS0."
  type        = string
}

variable "soft_delete_enabled" {
  description = "Is soft delete enable for this Vault? Defaults to true."
  type        = bool
  default     = true
}

variable "identity" {
  description = "Specifies the type of Identity that should be configured on this Recovery Services Vault"
  type = object({
    type = string
  })
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}