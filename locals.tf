# [START] Docker Environment Variables
locals {
  env_variables = {
    DOCKER_REGISTRY_SERVER_URL            = "https://acrPaysystemsDev001.azurecr.io"
    DOCKER_REGISTRY_SERVER_USERNAME       = "acrPaysystemsDev001"
    DOCKER_REGISTRY_SERVER_PASSWORD       = "root"
    NODE_VERSION                          = "18.9.0"
    MODERN_AWARDS_ACCESS_TOKEN          = "52e1516623664f9b8c416309a599ea34"
  }
}


# ToDo update with actual values
