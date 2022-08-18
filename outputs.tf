output "name" {
  description = "Name of the resource group"
  value       = var.resource_group_name
  depends_on  = [azurerm_resource_group.rg]
}
output "location" {
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
