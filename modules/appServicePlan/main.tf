resource "azurerm_service_plan" "main" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux" # Essential for Java JAR deployments
  sku_name            = var.sku_name
}
