resource "azurerm_linux_web_app" "webapp" {
  name                = var.webapp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id
  https_only          = true

  site_config {
    always_on           = true
    minimum_tls_version = var.minimum_tls_version

    app_settings = {
      WEBSITE_RUN_FROM_PACKAGE = "1" # Tells App Service to run from the deployed zip
      # WEBSITES_PORT = "8080" # Uncomment if your app listens on this port
    }
    application_stack {
      node_version        = var.technology == "node" ? var.node_version : null
      java_version        = var.technology == "java" ? var.java_version : null
      java_server         = var.technology == "java" ? var.java_server : null
      java_server_version = var.technology == "java" ? var.java_server_version : null
      python_version      = var.technology == "python" ? var.python_version : null
      dotnet_version      = var.technology == "dotnet" ? var.dotnet_version : null
    }
    app_command_line    = var.technology == "java" ? "java -jar /home/site/wwwroot/database_service_project-${var.java_artifact_version}-SNAPSHOT.jar.original --server.port=80" : null
  }
}
