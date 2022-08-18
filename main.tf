resource "azurerm_resource_group" "rg" {
  location      = var.location
  name          = var.resource_group_name

  tags          = var.tags
}

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
