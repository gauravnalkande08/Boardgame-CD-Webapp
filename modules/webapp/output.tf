output "id" {
  description = "The ID of the Azure Web App"
  value       = azurerm_linux_web_app.webapp.id # FIX: Corrected reference
}

output "name" {
  description = "The name of the Azure Web App"
  value       = azurerm_linux_web_app.webapp.name # FIX: Corrected reference
}

output "default_hostname" {
  description = "The default hostname of the Azure Web App"
  value       = azurerm_linux_web_app.webapp.default_hostname # FIX: Corrected reference
}
