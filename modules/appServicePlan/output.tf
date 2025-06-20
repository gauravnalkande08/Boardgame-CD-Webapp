output "id" {
  description = "The ID of the App Service Plan"
  value       = azurerm_app_service_plan.app_service_plan.id # FIX: Corrected reference
}

output "name" {
  description = "The name of the App Service Plan"
  value       = azurerm_app_service_plan.app_service_plan.name # FIX: Corrected reference
}
