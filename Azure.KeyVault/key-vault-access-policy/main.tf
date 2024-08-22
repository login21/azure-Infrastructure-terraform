## Access the configuration of the AzureRM provider ##
data "azurerm_client_config" "current" {}

## Getting information from the key vault resource that was created ##
data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}


data "azuread_service_principal" "kv_service_principal" {
  display_name = var.service_principal_name
}

## Creating the service principal access policy ##
resource "azurerm_key_vault_access_policy" "key_vault_access_policy" {
  key_vault_id       = data.azurerm_key_vault.key_vault.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = data.azuread_service_principal.kv_service_principal.object_id
  key_permissions    = var.key_permissions
  secret_permissions = var.secret_permissions
}