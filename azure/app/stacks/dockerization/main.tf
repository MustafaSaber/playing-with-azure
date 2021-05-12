# This is where you put your resource declaration

# Container Registery

resource "azurerm_resource_group" "rg" {
  name     = "<%= Terraspace.env %>-resources"
  location = var.rg_location
}

resource "azurerm_container_registry" "acr" {
  name                     = "intouch"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  sku                      = var.container_sku
  admin_enabled            = var.container_admin
  georeplication_locations = var.container_locations
}