variable "app_service_plan_name" {
  description = "Name of the App Service Plan."
  type        = string # Added type
}
variable "resource_group_name" {
  description = "Name of the resource group for the App Service Plan."
  type        = string # Added type
}
variable "location" {
  description = "Azure region for the App Service Plan."
  type        = string # Added type
}
variable "os_type" {
  description = "Operating system for the App Service Plan ('Linux' or 'Windows')."
  type        = string # Added type
}
variable "sku_name" { # This will be the size (e.g., 'B1', 'S1')
  description = "The name (size) of the SKU for the App Service Plan."
  type        = string # Added type
}
variable "sku_tier" { # Added for clarity and to align with the 'sku' block in main.tf
  description = "The tier of the SKU for the App Service Plan (e.g., 'Basic', 'Standard')."
  type        = string # Added type
}
