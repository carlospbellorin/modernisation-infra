# Resource Group Variables
variable "resource_group_name" {
  type                       = string
  description                = "Name of resource group"
  default                    = "rg-paysystems-dev-001"
}
variable "location" {
    type                     = string
    description              = "Name of region"
    default                  = "Australia East"
}
variable "tags" {
  description                = "Tags to apply to the resources"
  type                       = map(string)
  default                    = {
    project                  = "modernisation"
    environment              = "dev"
    terraform_provisioned    = "true"
  }
}
# Azure Container Registry Variables
variable "azure_container_registry_name" {
  type                       = string
  description                = "Name of the Azure Container Registry"
  default                    = "acrPaysystemsDev001"
}
variable "us_geo_replication_location" {
  type                       = string
  description                = "Name of the US geo-replication location"
  default                    = "East US"
}
variable "europe_geo_replication_location" {
  type                       = string
  description                = "Name of the Europe geo-replication location"
  default                    = "West Europe"
}
# User Assigned Identity Variables
variable "user_assigned_identity_name" {
  type                       = string
  description                = "Name of the UAI to pull images"
  default                    = "uai-paysystemspull-Dev-001"
}
