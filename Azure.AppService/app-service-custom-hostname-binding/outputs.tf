output "name" {
  description = "The custom hostname of the App"
  value       = azurerm_app_service_custom_hostname_binding.app_custom_hostname.hostname
}
