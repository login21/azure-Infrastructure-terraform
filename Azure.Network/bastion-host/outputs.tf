output "name" {
  description = "The name of the newly created Public IP."
  value       = azurerm_bastion_host.bastion_host.name
}
