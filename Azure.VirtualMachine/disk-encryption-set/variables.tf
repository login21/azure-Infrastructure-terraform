variable "kv_resource_group_name" {
  description = "Specifies the name of the Resource Group where Key vault exist."
  type        = string
}
variable "key_vault_name" {
  description = "Specifies the name of the Key Vault."
  type        = string
}

variable "vault_key_name" {
  description = "Specifies the name of the Key Vault Key."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the name of the Resource Group where the Disk Encryption Set should exist."
  type        = string
}

variable "name" {
  description = "The name of the Disk Encryption Set."
  type        = string
}

variable "identity" {
  description = "The type of Managed Service Identity that is configured on this Disk Encryption Set."
  type = object({
    type = string
  })
}

variable "key_permissions" {
  description = "Specifies key permissions."
  type        = list(string)
}

# variable "role_definition_name" {
#   description = "Specifies the name of the role"
#   type        = string
# }
