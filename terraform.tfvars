# Infrastructure Variables (These override defaults from variables.tf if specified)
location               = "West US 2"
support_resource_group = "t-kinog-support-rg"

# JFrog and Artifact Deployment Variables
# These must be provided as they don't have defaults in variables.tf
jfrog_url             = "https://trialn0mkti.jfrog.io/artifactory/boardgame-artifacts-libs-snapshot/" # REPLACE with your actual JFrog URL
java_artifact_version = "0.0.7"                                                                    # REPLACE with the actual version of your Java app artifact
# dotnet_artifact_version = "0.0.0" # Uncomment and change if deploying dotnet in the future
