output "win_webapp_name" {
  description = "The name of the newly created Windows Web App."
  value       = azurerm_windows_web_app.win_web_app.name

}

output "id" {
  description = "The id of the newly created Windows Web App."
  value       = azurerm_windows_web_app.win_web_app.id

}

