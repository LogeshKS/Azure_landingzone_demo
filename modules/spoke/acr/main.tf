resource "azurerm_container_registry" "acr" {
  name                     = "hasacr${var.environment}"
  resource_group_name      = var.spoke_rg_name
  location                 = var.location
  sku                      = "Standard"
}