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
# Non Production Key Vault variables
# -------------------------------------------------------------
variable "key_vault_name" {
  description = "The name of the Non Prod Key Vault"
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the Non Prod Key Vault"
  type        = string
}


# -------------------------------------------------------------
# Non Production Key Vault Service Pricipal Acess Policy variables
# -------------------------------------------------------------
variable "key_permissions" {
  description = "The List of the key permissions"
  type        = list(any)
}

variable "secret_permissions" {
  description = "The List of secret permissions"
  type        = list(any)
}


variable "service_principal_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

