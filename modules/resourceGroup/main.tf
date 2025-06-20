resource "azurerm_resource_group" "example" {
  name     = var.name
  location = var.location
}

output "name" {
  value       = azurerm_resource_group.example.name
  description = "The name of the created resource group."
}

output "location" {
  value       = azurerm_resource_group.example.location
  description = "The location of the created resource group."
}

output "id" {
  value       = azurerm_resource_group.example.id
  description = "The ID of the created resource group."
}
