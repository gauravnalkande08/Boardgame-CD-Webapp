variable "name" {
  description = "The name of the Azure Web App"
  type        = string
}

variable "location" {
  description = "The Azure region for the Web App"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Web App will be created"
  type        = string
}

variable "service_plan_id" {
  description = "The ID of the App Service Plan to associate with the Web App"
  type        = string
}

variable "java_version" {
  description = "The Java version for the Web App runtime"
  type        = string
}

variable "app_jar_name" {
  description = "The name of your deployed JAR file (e.g., app.jar or your_artifact_name.jar)"
  type        = string
}

variable "app_settings" {
  description = "A map of application settings (environment variables) for the Web App"
  type        = map(string)
  default     = {}
}
