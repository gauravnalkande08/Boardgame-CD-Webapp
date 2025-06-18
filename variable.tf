variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "East US" # You can change this to your preferred region, e.g., "Central India"
}

variable "resource_group_name" {
  description = "Name of the resource group for the application"
  type        = string
  default     = "ref-app-RG"
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "ref-app-appservice-plan"
}

variable "webapp_name" {
  description = "Name of the Azure Web App"
  type        = string
  default     = "boardgame-webapp" # Your application name
}

variable "app_service_plan_sku_name" {
  description = "The SKU name for the App Service Plan (e.g., B1, S1, P1v2)"
  type        = string
  default     = "B1" # Basic tier for dev/test. Use S1, P1v2, etc., for production.
}

variable "webapp_java_version" {
  description = "The Java version for the Web App runtime"
  type        = string
  default     = "17" # As requested
}

variable "webapp_app_jar_name" {
  description = "The name of your deployed JAR file (important for startup command)"
  type        = string
  # Assuming the JAR will be renamed to 'app.jar' during deployment for simplicity.
  # If you prefer to keep the original name, change this value AND ensure your deployment process
  # does NOT rename it.
  default     = "app.jar"
}

variable "webapp_app_settings" {
  description = "A map of application settings for the Web App"
  type        = map(string)
  default = {
    "SERVER_PORT" = "80" # Azure Web Apps expose port 80/443 externally
    "WEBSITES_CONTAINER_START_TIME_LIMIT" = "300" # Increase startup timeout for larger JARs
    # Add your specific application configuration settings here, e.g.:
    # "SPRING_DATASOURCE_URL"      = "jdbc:mysql://<your_mysql_server>.mysql.database.azure.com:3306/<your_db_name>?useSSL=true"
    # "SPRING_DATASOURCE_USERNAME" = "your_db_username"
    # "SPRING_DATASOURCE_PASSWORD" = "your_db_password"
  }
}
