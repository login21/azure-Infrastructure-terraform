output "name" {
  description = "The name of the newly created Public IP."
  value       = azurerm_public_ip.public_ip.name
}

output "id" {
  description = "The Id of the newly created Public IP."
  value       = azurerm_public_ip.public_ip.id
}