output "id" {
  description = "The ID of the Azure Web App"
  value       = azurerm_linux_web_app.main.id
}

output "name" {
  description = "The name of the Azure Web App"
  value       = azurerm_linux_web_app.main.name
}

output "default_hostname" {
  description = "The default hostname of the Azure Web App"
  value       = azurerm_linux_web_app.main.default_hostname
}
