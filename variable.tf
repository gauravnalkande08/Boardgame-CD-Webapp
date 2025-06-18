variable "location" {
  description = "The Azure Region where all resources will be created."
}

variable "support_resource_group" {
  description = "Name of the resource group for supporting infrastructure."
}

# --- NEW: Variables for Artifact Deployment ---
variable "jfrog_url" {}

# IMPORTANT: JFROG_USER and JFROG_PASSWORD should NOT be defined as Terraform variables
# that you pass directly into local-exec. Instead, set them as environment variables
# in the execution environment (e.g., your CI/CD pipeline). This is a crucial security practice.
# Example usage in your CI/CD script:
# export JFROG_USER="your_jfrog_username"
# export JFROG_PASSWORD="your_jfrog_api_key_or_access_token"

# variable "dotnet_artifact_version" {
#   description = "The specific version of the Dotnet application artifact to download and deploy (e.g., '1.0.0' or 'build-123'). Changing this value will trigger a new download and deployment."
#   type        = string
# }

variable "java_artifact_version" {
  description = "The specific version of the Java application artifact to download and deploy (e.g., '1.0.0' or 'build-456'). Changing this value will trigger a new download and deployment."
  type        = string
}
