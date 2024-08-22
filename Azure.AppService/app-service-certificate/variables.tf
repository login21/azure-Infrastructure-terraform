variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "service_plan_name" {
  description = "The name which should be used for this Windows Function App. Changing this forces a new Windows Function App to be created. Limit the function name to 32 characters to avoid naming collisions."
  type        = string
}

variable "app_keyvault_name" {
  description = "Specifies the name of the Key Vault."
  type        = string
}

variable "keyvault_username" {
  description = "Specifies the name of the Management Template. Possible values are: Key Management, Secret Management, Certificate Management, Key & Secret Management, Key & Certificate Management, Secret & Certificate Management, Key, Secret, & Certificate Management"
  type        = string
}

variable "vault_certificate_name" {
  description = "Specifies the name of the Key Vault Certificate."
  type        = string

}

variable "name" {
  description = "Specifies the name of the certificate."
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the associated App Service plan. Must be specified when the certificate is used inside an App Service Environment hosted App Service."
  type        = string
}

variable "key_vault_secret_id" {
  description = "The ID of the Key Vault secret."
  type        = string
}
