variable "name" {
  description = "The name of the App Service Plan"
  type        = string
}

variable "location" {
  description = "The Azure region for the App Service Plan"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the App Service Plan will be created"
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the App Service Plan (e.g., B1, S1, P1v2)"
  type        = string
}
