resource "azurerm_linux_web_app" "webapp" { # Resource name is "webapp"
  name                = var.webapp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id
  https_only          = true

  site_config {
    minimum_tls_version = var.minimum_tls_version
    application_stack {
      node_version        = var.technology == "node" ? var.node_version : null
      java_version        = var.technology == "java" ? var.java_version : null
      java_server         = var.technology == "java" ? var.java_server : null
      java_server_version = var.technology == "java" ? var.java_server_version : null
      python_version      = var.technology == "python" ? var.python_version : null
      dotnet_version      = var.technology == "dotnet" ? var.dotnet_version : null
    }
  }

  # dynamic "zip_deploy_file" { # This block is commented out as requested for initial deployment
  #   for_each = var.artifact_path != null ? [var.artifact_path] : []
  #   content {
  #     path = zip_deploy_file.value
  #     hash_content = filebase64sha256(zip_deploy_file.value)
  #   }
  # }
}
