output "name" {
  description = "The name of the newly created Public IP."
  value       = azurerm_network_interface.nic.name
}

output "id" {
  description = "The id of the newly created Public IP."
  value       = azurerm_network_interface.nic.id
}