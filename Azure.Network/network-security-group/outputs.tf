output "name" {
  description = "The name of the newly created network security group."
  value       = azurerm_network_security_group.nsg.name
}
