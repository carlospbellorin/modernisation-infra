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
resource "azurerm_user_assigned_identity" "uai_pull"{
  name                = var.user_assigned_identity_name
  resource_group_name = azurerm_resource_group.rg.name
  location = var.location

  tags = var.tags
}
# [END] azurerm_assign_identity

# [START] azurerm_role_assignment
resource "azurerm_role_assignment" "role_assignment" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.uai_pull.principal_id
}
# [END] azurerm_role_assignment

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

  identity {
    type = "SystemAssigned, UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.uai_pull.id]
  }

  app_settings = local.env_variables

  tags = var.tags
}
# [END] azurerm_linux_web_app

# [START] azurerm_linux_web_app_slot
resource "azurerm_linux_web_app_slot" "paysystems_container_staging" {
  name           = var.linux_web_app_slot_name
  app_service_id = azurerm_linux_web_app.paysystems_container.id

  site_config {}

  identity {
    type = "SystemAssigned, UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.uai_pull.id]
  }

  app_settings  = local.env_variables
  tags          = var.tags
}
# [END] azurerm_linux_web_app_slot

# [START] azurerm_applications_insights
resource "azurerm_application_insights" "paysystems_app_insights" {
  name                = var.app_insights_name
  location            = var.app_insights_location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "Node.JS"
  tags                = var.tags
}
# [END] azurerm_applications_insights
