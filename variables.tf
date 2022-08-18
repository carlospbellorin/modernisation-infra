# [START] Resource Group Variables
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
# [END] Resource Group Variables

# [START] Azure Container Registry Variables
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
# [END] Azure Container Registry Variables

# [START] User Assigned Identity Variables
variable "user_assigned_identity_name" {
  type                       = string
  description                = "Name of the UAI to pull images"
  default                    = "uai-paysystemspull-Dev-001"
}
# [END] User Assigned Identity Variables

# [START] App Service Plan Variables:
variable "service_plan_name" {
  type                       = string
  description                = "Name of the App Service Plan"
  default                    = "asp-paysystems-dev-001"
}
variable "service_plan_location" {
  type                       = string
  description                = "Name of the App Service Plan location"
  default                    = "Australia East"
}
variable "service_plan_os_type" {
  type                       = string
  description                = "Name of the App Service Plan kind"
  default                    = "Linux"
}
# [END] App Service Plan Variables

# [START] Linux Web App Variables:
variable "linux_web_app_name" {
  type                       = string
  description                = "Name of the Linux Web App"
  default                    = "lwa-paysystems-dev-001"
}
variable "linux_web_app_location" {
  type                       = string
  description                = "Name of the Linux Web App location"
  default                    = "Australia East"
}
# [END] Linux Web App Variables

# [START] Linux Web App Slot Variables:
variable "linux_web_app_slot_name" {
  type                       = string
  description                = "Name of the Linux Web App Slot"
  default                    = "lwa-slot-paysystems-dev-001"
}

# [END] Linux Web App Slot Variables

