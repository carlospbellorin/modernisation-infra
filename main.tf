# [START] azurerm_resource_group
resource "azurerm_resource_group" "rg" {
  location      = var.location
  name          = var.resource_group_name

  tags          = var.tags
}
# [END] azurerm_resource_group

# [START] azurerm_container_registry
resource "azurerm_container_registry" "acr" {
  name                      = var.azure_container_registry_name
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = var.location
  sku                       = "Premium"
  admin_enabled             = false
  tags                  = var.tags
  georeplications {
    location                = var.us_geo_replication_location
    zone_redundancy_enabled = true
    tags                    = var.tags
  }
  georeplications {
    location                = var.europe_geo_replication_location
    zone_redundancy_enabled = true
    tags                    = var.tags
  }

}
# [END] azurerm_container_registry

# [START] azurerm_assign_identity
resource "azurerm_user_assigned_identity" "uai-pull"{
  name                = "var.user_assigned_identity_name"
  resource_group_name = azurerm_resource_group.rg.name
  location = var.location

  tags = var.tags
}
# [END] azurerm_assign_identity

# [START] azurerm_app_service_plan
resource "azurerm_service_plan" "paysystems_app_service_plan" {
  name                = var.service_plan_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = var.service_plan_os_type
  sku_name            = "P2v2"
  tags                = var.tags
}
# [END] azurerm_app_service_plan

# [START] azurerm_linux_web_app
resource "azurerm_linux_web_app" "paysystems_container" {
  location            = var.linux_web_app_location
  name                = var.linux_web_app_name
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.paysystems_app_service_plan.id
  site_config {}

  app_settings = local.env_variables
}
# [END] azurerm_linux_web_app
