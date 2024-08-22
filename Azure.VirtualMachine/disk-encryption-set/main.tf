data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

data "azurerm_resource_group" "kv_rg" {
  name = var.kv_resource_group_name
}

data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.kv_resource_group_name
}

data "azurerm_key_vault_key" "vault_key" {
  name         = var.vault_key_name
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

resource "azurerm_disk_encryption_set" "des" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.resource_group.name
  location            = data.azurerm_resource_group.resource_group.location
  key_vault_key_id    = data.azurerm_key_vault_key.vault_key.id

  identity {
    type = var.identity.type
  }
}

/* resource "azurerm_key_vault_access_policy" "key_vault_access_policy" {

  depends_on = [
    azurerm_disk_encryption_set.des
  ]

  key_vault_id = data.azurerm_key_vault.key_vault.id

  tenant_id       = azurerm_disk_encryption_set.des.identity.0.tenant_id
  object_id       = azurerm_disk_encryption_set.des.identity.0.principal_id
  key_permissions = var.key_permissions
}  */

resource "azurerm_role_assignment" "desRoleAssignment" {
  depends_on = [
    azurerm_disk_encryption_set.des
  ]

  scope                = data.azurerm_key_vault.key_vault.id
  role_definition_name = "Key Vault Crypto Service Encryption User"
  principal_id         = azurerm_disk_encryption_set.des.identity.0.principal_id
}

resource "azurerm_role_assignment" "desRoleAssignment1" {
  depends_on = [
    azurerm_disk_encryption_set.des
  ]

  scope                = data.azurerm_key_vault.key_vault.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = azurerm_disk_encryption_set.des.identity.0.principal_id
}

