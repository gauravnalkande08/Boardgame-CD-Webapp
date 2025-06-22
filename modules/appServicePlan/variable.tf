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
variable "sku_name" {}
variable "os_type" {}
