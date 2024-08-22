output "name" {
  description = "The name of the Virtual Network."
  value       = azurerm_virtual_network.vnet.name
}

output "id" {
  description = "Id of the virtual network."
  value       = azurerm_virtual_network.vnet.id
}
