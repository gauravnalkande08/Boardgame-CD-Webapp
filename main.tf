locals {
  java_artifact_local_path = "${path.cwd}/artifacts/database_service_project-${var.java_artifact_version}-SNAPSHOT.zip"
  # dotnet_artifact_local_path = "${path.cwd}/artifacts/helloworld-dotnet-app-${var.dotnet_artifact_version}.zip"
}

# Resource to download the Java artifact
resource "null_resource" "download_java_artifact" {
  triggers = {
    artifact_version = var.java_artifact_version
  }

  # FIX: provisioner block must be nested inside the resource block
  provisioner "local-exec" {
    environment = {
      JFROG_USER     = var.jfrog_user      # Assuming you have a variable named jfrog_user
      JFROG_PASSWORD = var.jfrog_password
    shell = ["bash.exe", "-c"]
    command = <<-EOT
      mkdir -p ./artifacts
      curl -u "$JFROG_USER:$JFROG_PASSWORD" "${var.jfrog_url}database_service_project-${var.java_artifact_version}-SNAPSHOT.zip" -o "${local.java_artifact_local_path}"
    EOT
  }
}

module "resourcegroup" {
  source   = "./modules/resourceGroup"
  name     = var.support_resource_group # Uses the name from your root variables
  location = var.location               # Uses the location from your root variables
}

# Module for linux_101_1 (VM) - Still commented out as per your input
# module "linux_101_1" {
#   source              = "tfe.axa-cloud.com/Global-Module-Sharing/vm/azure"
#   resource_group_name = azurerm_resource_group.support_rg.name # Or module.resourcegroup.name if intended for this RG
#   location            = azurerm_resource_group.support_rg.location
#   vm_name             = "linux-101-1"
#   vm_os_publisher     = "Canonical"
#   vm_os_offer         = "0001-com-ubuntu-server-focal"
#   vm_os_sku           = "20_04-lts-gen2"
#   vm_os_version       = "latest"
#   vm_size             = "Standard_B1s"
#   tags                = { env = "dev", project = "kinog" }
# }

# Module for linux_101_3 (VM) - Still commented out as per your input
# module "linux_101_3" {
#   source              = "tfe.axa-cloud.com/Global-Module-Sharing/vm/azure"
#   resource_group_name = azurerm_resource_group.support_rg.name # Or module.resourcegroup.name
#   location            = azurerm_resource_group.support_rg.location
#   vm_name             = "linux-101-3"
#   vm_os_publisher     = "Canonical"
#   vm_os_offer         = "0001-com-ubuntu-server-focal"
#   vm_os_sku           = "20_04-lts-gen2"
#   vm_os_version       = "latest"
#   vm_size             = "Standard_B1s"
#   tags                = { env = "dev", project = "kinog" }
# }


# App Service Plan
module "appserviceplan1" {
  source                = "./modules/appServicePlan"
  app_service_plan_name = "boardgame-appserviceplan-java-kino"
  resource_group_name   = module.resourcegroup.name 
  location              = var.location
  sku_name              = "P1v2"
  os_type               = "Linux"
}

##############################################################################################################
# resource "null_resource" "download_dotnet_artifact" {
#   # This block is for Dotnet, currently commented out
#   # triggers = {
#   #   artifact_version = var.dotnet_artifact_version
#   # }
#   # provisioner "local-exec" {
#   #   command = "mkdir -p ${path.cwd}/artifacts && curl -sSL -u \"${JFROG_USER}:${JFROG_PASSWORD}\" -o \"${local.dotnet_artifact_local_path}\" \"${var.jfrog_url}/my-repo/helloworld-dotnet-app-${var.dotnet_artifact_version}.zip\""
#   # }
#   # depends_on = [module.webappdotnet]
# }
# --- COMMENT END: Artifact Download and Application Deployment Logic ---


# webapp java kino ref app
module "webappjava" {
  source              = "./modules/webapp"
  webapp_name         = "boardgame-webapp-java-kino"
  service_plan_id     = module.appserviceplan1.id # FIX: Corrected to use .id output from appserviceplan module
  location            = var.location
  resource_group_name = module.resourcegroup.name # FIX: Using the resource group created by 'module.resourcegroup'
  minimum_tls_version = "1.2"
  technology          = "java"
  java_version        = "11"
  java_server         = "TOMCAT"
  java_server_version = "10.0"
  java_artifact_version = var.java_artifact_version
  artifact_path = local.java_artifact_local_path
  depends_on = [
    null_resource.download_java_artifact,
  ]
}

# webapp dotnet kino ref app (Still commented out as per your input)
# module "webappdotnet" {
#   source              = "./modules/webapp"
#   webapp_name         = "helloworld-webapp-dotnet-kino"
#   service_plan_id     = module.appserviceplan1.id # Corrected to use .id
#   location            = var.location
#   resource_group_name = module.resourcegroup.name # Using the correct RG
#   minimum_tls_version = "1.2"
#   technology          = "dotnet"
#   dotnet_version      = "6.0"
#   artifact_path       = null # Set to null for infrastructure-only deploy
# }

# Output for Java Web App hostname
output "default_site_hostname_java_app" {
  description = "The default hostname of the Azure Java Web App."
  value       = module.webappjava.default_hostname # FIX: Corrected to use .default_hostname output from webapp module
}

# Output for Dotnet Web App hostname (Still commented out)
# output "default_site_hostname_dotnet_app" {
#   description = "The default hostname of the Azure Dotnet Web App."
#   value       = var.dotnet_artifact_version != "0.0.0" ? module.webappdotnet[0].default_hostname : "N/A - Dotnet app not deployed"
# }
