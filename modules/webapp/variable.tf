variable "webapp_name" {
  description = "Name of the Azure Web App."
  type        = string # Added type
}

variable "location" {
  description = "Azure region where resources will be deployed."
  type        = string # Added type
}

variable "resource_group_name" {
  description = "Name of the resource group where the Web App will reside."
  type        = string # Added type
}

variable "service_plan_id" {
  description = "ID of the App Service Plan to associate with the Web App."
  type        = string # Added type
}

variable "minimum_tls_version" {
  description = "Minimum TLS version for the Web App."
  type        = string
  default     = "1.2"
}

variable "technology" {
  description = "Technology stack of the web app (e.g., 'dotnet', 'java', 'node', 'python')."
  type        = string # Added type
}

variable "node_version" {
  description = "Node.js version for the web app (if technology is 'node')."
  type        = string
  default     = null
}

variable "java_version" {
  description = "Java version for the web app (if technology is 'java')."
  type        = string
  default     = null
}

variable "java_server" {
  description = "Java server for the web app (e.g., 'TOMCAT', 'JBOSS')."
  type        = string
  default     = null
}

variable "java_server_version" {
  description = "Java server version for the web app."
  type        = string
  default     = null
}

variable "python_version" {
  description = "Python version for the web app (if technology is 'python')."
  type        = string
  default     = null
}

variable "dotnet_version" {
  description = "Dotnet version for the web app (if technology is 'dotnet')."
  type        = string
  default     = null
}
