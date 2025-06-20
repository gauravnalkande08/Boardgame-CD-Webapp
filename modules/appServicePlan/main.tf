resource "azurerm_app_service_plan" "app_service_plan" { # Corrected resource name to "app_service_plan"
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = var.os_type # Uses var.os_type from module variable
  reserved            = var.os_type == "Linux" ? true : false # Required for Linux App Service Plans

  sku {
    tier = var.sku_tier # Tier (e.g., "Basic", "Standard")
    size = var.sku_name # Size (e.g., "B1", "S1")
  }
}
