output "name" {
  description = "The Name of the newly created app resource group."
  value       = azurerm_resource_group.resource_group.name
}

output "location" {
  description = "The location of the newly created resource group."
  value       = azurerm_resource_group.resource_group.location
}

output "id" {
  description = "The Name of the newly created app resource group."
  value       = azurerm_resource_group.resource_group.id
}