# [START] Resource Group Outputs:
output "resource_group_name" {
  description = "Name of the resource group"
  value       = var.resource_group_name
  depends_on  = [azurerm_resource_group.rg]
}
output "resource_group_location" {
  description = "Resource Group Location"
  value       = var.location
}
output "resource_group_id" {
  description = "Resource Group ID"
  value       = azurerm_resource_group.rg.id
}
output "resource_group_tags" {
  description = "Resource Group Tags"
  value       = azurerm_resource_group.rg.tags
}
# [END] Resource Group Outputs

# [START] Azure Container Registry Outputs:
output "azure_container_registry_name" {
  description = "Name of the Azure Container Registry"
  value       = azurerm_container_registry.acr.name
  depends_on  = [azurerm_container_registry.acr]
}
output "azure_container_registry_location"  {
  description = "Location of the Azure Container Registry"
  value       = azurerm_container_registry.acr.location
}
output "azure_container_registry_id" {
  description = "ID of the Azure Container Registry"
  value       = azurerm_container_registry.acr.id
}
output "azure_container_registry_tags" {
  description = "Tags of the Azure Container Registry"
  value       = azurerm_container_registry.acr.tags
}
# [END] Azure Container Registry Outputs

# [START] Assigned Identity Outputs:
output "user_assigned_identity_name" {
  description = "Name of the Assigned Identity"
  value       = azurerm_user_assigned_identity.uai_pull.name
  depends_on  = [azurerm_user_assigned_identity.uai_pull]
}
output "user_assigned_identity_client_id" {
  description = "ID of the Assigned Identity"
  value       = azurerm_user_assigned_identity.uai_pull.client_id
}
output "user_assigned_identity_principal_id" {
  description = "Principal ID of the Assigned Identity"
  value       = azurerm_user_assigned_identity.uai_pull.principal_id
}
output "user_assigned_tenant_id" {
  description = "Tenant ID of the Assigned Identity"
  value       = azurerm_user_assigned_identity.uai_pull.tenant_id
}
# [END] Assigned Identity Outputs

# [START} App Service Plan Outputs:
output "service_plan_name" {
  description = "Name of the App Service Plan"
  value       = azurerm_service_plan.paysystems_app_service_plan.name
  depends_on  = [azurerm_service_plan.paysystems_app_service_plan]
}
output "service_plan_location" {
  description = "Location of the App Service Plan"
  value       = azurerm_service_plan.paysystems_app_service_plan.location
}
output "service_plan_id" {
  description = "ID of the App Service Plan"
  value       = azurerm_service_plan.paysystems_app_service_plan.id
}
output "service_plan_tags" {
  description = "Tags of the App Service Plan"
  value       = azurerm_service_plan.paysystems_app_service_plan.tags
}
# [END] App Service Plan Outputs

# [START] Linux web app Outputs:
output "linux_web_app_name" {
  description = "Name of the Linux web app"
  value       = azurerm_linux_web_app.paysystems_container.name
  depends_on  = [azurerm_linux_web_app.paysystems_container]
}
output "linux_web_app_location" {
  description = "Location of the Linux web app"
  value       = azurerm_linux_web_app.paysystems_container.location
}
output "linux_web_app_id" {
  description = "ID of the Linux web app"
  value       = azurerm_linux_web_app.paysystems_container.id
}
# [END] Linux web app Outputs

# [START] Linux web app slot Outputs:
output "linux_web_app_slot_name" {
  description = "Name of the Linux web app slot"
  value       = azurerm_linux_web_app_slot.paysystems_container_staging.name
  depends_on  = [azurerm_linux_web_app_slot.paysystems_container_staging]
}
output "linux_web_app_slot_id" {
  description = "ID of the Linux web app slot"
  value       = azurerm_linux_web_app_slot.paysystems_container_staging.id
}
# [END] Linux web app slot Outputs

# [START] Application Insights Outputs:
output "application_insights_name" {
  description = "Name of the Application Insights"
  value       = azurerm_application_insights.paysystems_app_insights.name
  depends_on  = [azurerm_application_insights.paysystems_app_insights]
}
output "application_insights_location" {
  description = "Location of the Application Insights"
  value       = azurerm_application_insights.paysystems_app_insights.location
}
output "application_insights_id" {
  description = "ID of the Application Insights"
  value       = azurerm_application_insights.paysystems_app_insights.id
}
output "instrumentation_key" {
  description = "Instrumentation Key of the Application Insights"
  value       = azurerm_application_insights.paysystems_app_insights.instrumentation_key
  sensitive   = true
}
output "application_insights_tags" {
  description = "Tags of the Application Insights"
  value       = azurerm_application_insights.paysystems_app_insights.tags
}
# [END] Application Insights Outputs

