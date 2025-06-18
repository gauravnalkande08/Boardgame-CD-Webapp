resource "azurerm_linux_web_app" "main" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id

  site_config {
    application_stack {
      java_server         = "JAVA"          # For standalone executable JARs
      java_version        = var.java_version
      java_server_version = "Java SE"       # Specific for Java SE

      # If you were deploying a WAR and needed a Tomcat container, it would be:
      # java_server         = "TOMCAT"
      # java_version        = var.java_version
      # java_server_version = "TOMCAT|9.0-java${var.java_version}" # Example for Tomcat 9 with Java 17
    }

    app_command_line = "java -jar /home/site/wwwroot/${var.app_jar_name}"
    
    client_affinity_enabled = false
    https_only              = true
    min_tls_version         = "1.2"
  }

  app_settings = var.app_settings

  identity {
    type = "SystemAssigned"
  }
}
