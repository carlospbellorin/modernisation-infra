# Resource Group Outputs:
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

# Azure Container Registry Outputs:
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
