resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = var.kind
  reserved            = var.kind == "Linux" ? true : false # Required for Linux App Service Plans

  sku {
    tier = var.tier
    size = var.size
  }
}
