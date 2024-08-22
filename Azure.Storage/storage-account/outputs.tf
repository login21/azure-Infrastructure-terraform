output "name" {
  description = "The name of the newly created Blob Storage account."
  value       = azurerm_storage_account.storage_account.name
}

output "id" {
  description = "The id of the newly created Blob Storage account."
  value       = azurerm_storage_account.storage_account.id
}

output "primary_connection_string" {
  description = "The primary_connection_string of the newly created Blob Storage account."
  value       = azurerm_storage_account.storage_account.primary_connection_string
}


