# Resource Group (remains in root as it's often a top-level dependency)
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# Call the App Service Plan Module
module "app_service_plan" {
  source = "./modules/app-service-plan" # Local path to your module

  name                = var.app_service_plan_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku_name            = var.app_service_plan_sku_name
}

# Call the Web App Module
module "webapp" {
  source = "./modules/webapp" # Local path to your module

  name                = var.webapp_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  service_plan_id     = module.app_service_plan.id # Output from the app_service_plan module

  java_version        = var.webapp_java_version
  app_jar_name        = var.webapp_app_jar_name
  app_settings        = var.webapp_app_settings
}
