resource "azurerm_virtual_network" "spoke" {
  name = var.spokevpcname
  location = var.spokelocation
  resource_group_name = var.spokergname
  address_space = [var.spokevnet_cidr]

  tags = var.spokevnet_tags
}


#creating subnet for WAF
resource "azurerm_subnet" "Aks" {
  name = "aks"
  resource_group_name =  var.spokergname
  virtual_network_name = azurerm_virtual_network.spoke.name
  address_prefixes = [var.subnet_aks_cidr]
  service_endpoints = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.ContainerRegistry"]

}