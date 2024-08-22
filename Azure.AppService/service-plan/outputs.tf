output "name" {
  description = "The Name of the newly created app service plan."
  value       = azurerm_service_plan.app_service_plan.name
}

output "sku_name" {
  description = "The SKU used for the service plan"
  value       = azurerm_service_plan.app_service_plan.sku_name
}

output "id" {
  description = "The ID of the Service Plan."
  value       = azurerm_service_plan.app_service_plan.id
}
