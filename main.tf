# App Service Plan
module "appserviceplan1" {
  source              = "./modules/appServicePlan" # Assuming you have this local module
  resource_group_name = azurerm_resource_group.support_rg.name
  location            = azurerm_resource_group.support_rg.location
  app_service_plan_name = "appserviceplan1"
  os_type               = "Linux"
  sku_name              = "B1"
}

##############################################################################################################
locals {
  # dotnet_artifact_local_path = "${path.cwd}/artifacts/helloworld-dotnet-app-${var.dotnet_artifact_version}.zip"
  java_artifact_local_path   = "${path.cwd}/artifacts/boardgame-java-app-${var.java_artifact_version}.zip"
}

# Resource to download the Dotnet artifact from JFrog Artifactory
# resource "null_resource" "download_dotnet_artifact" {
#   triggers = {
#     artifact_version = var.dotnet_artifact_version
#   }

#   provisioner "local-exec" {
#     command = "mkdir -p ${path.cwd}/artifacts && curl -sSL -u \"${JFROG_USER}:${JFROG_PASSWORD}\" -o \"${local.dotnet_artifact_local_path}\" \"${var.jfrog_url}/my-repo/helloworld-dotnet-app-${var.dotnet_artifact_version}.zip\""
#   }
#   depends_on = [module.webappdotnet]
# }

# Resource to download the Java artifact from JFrog Artifactory
resource "null_resource" "download_java_artifact" {
  triggers = {
    artifact_version = var.java_artifact_version
  }

  provisioner "local-exec" {
    command = "mkdir -p ${path.cwd}/artifacts && curl -sSL -u \"${JFROG_USER}:${JFROG_PASSWORD}\" -o \"${local.java_artifact_local_path}\" \"${var.jfrog_url}/my-repo/boardgame-java-app-${var.java_artifact_version}.zip\""
  }

  depends_on = [module.webappjava]
}

# webapp dotnet kino ref app
# module "webappdotnet" {
#   source              = "./modules/webapp"
#   webapp_name         = "helloworld-webapp-dotnet-kino"
#   service_plan_id     = module.appserviceplan1.app_service_plan_id
#   location            = var.location
#   resource_group_name = var.support_resource_group
#   minimum_tls_version = "1.2"
#   technology          = "dotnet"
#   dotnet_version      = "6.0"
  # NEW: Pass the local path to the downloaded artifact.
  # The conditional 'null_resource.download_dotnet_artifact.id != ""' ensures
  # that this path is only passed if the download resource has been successfully
  # created/updated (i.e., the download completed).
#   artifact_path       = null_resource.download_dotnet_artifact.id != "" ? local.dotnet_artifact_local_path : null
# }

# Output for Dotnet Web App hostname
# output "default_site_hostname_dotnet_app" {
#   value = module.webappdotnet.default_site_hostname
# }

# webapp java kino ref app
module "webappjava" {
  source              = "./modules/webapp"
  webapp_name         = "boardgame-webapp-java-kino"
  service_plan_id     = module.appserviceplan1.app_service_plan_id
  location            = var.location
  resource_group_name = var.support_resource_group
  minimum_tls_version = "1.2"
  technology          = "java"
  java_version        = "11"
  java_server         = "TOMCAT"
  java_server_version = "10.0"
  # NEW: Pass the local path to the downloaded artifact.
  artifact_path       = null_resource.download_java_artifact.id != "" ? local.java_artifact_local_path : null
}

# Output for Java Web App hostname
output "default_site_hostname_java_app" {
  value = module.webappjava.default_site_hostname
}
