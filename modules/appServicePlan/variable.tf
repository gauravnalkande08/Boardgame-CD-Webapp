variable "app_service_plan_name" {
  description = "Name of the App Service Plan."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group for the App Service Plan."
  type        = string
}

variable "location" {
  description = "Azure region for the App Service Plan."
  type        = string
}

variable "tier" {
  description = "Tier of the App Service Plan (e.g., 'Standard', 'Basic', 'Premium')."
  type        = string
}

variable "size" {
  description = "Size of the App Service Plan (e.g., 'S1', 'B1', 'P1v2')."
  type        = string
}

variable "kind" {
  description = "Operating system for the App Service Plan ('Linux' or 'Windows')."
  type        = string
  default     = "Linux" # Assuming Linux based on previous web app config
}
