data "azurerm_resource_group" "app_service_rg" {
  name = var.resource_group_name
}

data "azurerm_service_plan" "app_service_plan" {
  name                = var.service_plan_name
  resource_group_name = data.azurerm_resource_group.app_service_rg.name
}

data "azurerm_key_vault" "app_key_vault" {
  name                = var.app_keyvault_name
  resource_group_name = data.azurerm_resource_group.app_service_rg.name
}

data "azurerm_key_vault_access_policy" "contributor" {
  name = var.keyvault_username
}

data "azurerm_key_vault_certificate" "vault_certificate" {
  name         = var.vault_certificate_name
  key_vault_id = data.azurerm_key_vault.app_key_vault.id
}

resource "azurerm_app_service_certificate" "app_service_certificate" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.app_service_rg.name
  location            = data.azurerm_resource_group.app_service_rg.location
  app_service_plan_id = data.azurerm_service_plan.app_service_plan.id
  key_vault_secret_id = data.azurerm_key_vault_certificate.vault_certificate.secret_id
}

# data "azuread_service_principal" "web_app_resource_provider" {
#   application_id = "abfa0a7c-a6b6-4736-8310-5855508787cd"
# }

