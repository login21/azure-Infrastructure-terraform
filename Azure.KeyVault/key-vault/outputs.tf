output "name" {
  description = "The name of the newly created Key Vault for the Non-Production Environment"
  value       = azurerm_key_vault.key_vault.name
}

output "uri" {
  description = "The URI of the Non Production Key Vault"
  value       = azurerm_key_vault.key_vault.vault_uri
}

output "id" {
  description = "The id of the newly created Key Vault for the Non-Production Environment"
  value       = azurerm_key_vault.key_vault.id
}
