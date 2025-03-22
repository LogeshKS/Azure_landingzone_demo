#enabling ddos protecction plan
resource "azurerm_network_ddos_protection_plan" "ddos_hub" {
  name = local.stackname  
  location = var.location
  resource_group_name = var.rgname
}

#creating vnet for hub

resource "azurerm_virtual_network" "hub" {
  name = local.stackname
  location = var.location
  resource_group_name = var.rgname
  address_space = [var.hubvnet_cidr]

  ddos_protection_plan {
    id = azurerm_network_ddos_protection_plan.ddos_hub.id
    enable = true
  }

  tags = var.hubvnet_tags
}


#creating subnet for WAF
resource "azurerm_subnet" "WAF" {
  name = "waf"
  resource_group_name =  var.rgname
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes = [var.subnet_waf_cidr]

}

#creating subnet for Bastion
resource "azurerm_subnet" "bastion" {
  name                 = "BastionSubnet" 
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = [var.subnet_bastion_cidr] # Minimum /26 CIDR block required for Bastion
}

#creating subnet for Jenkins
resource "azurerm_subnet" "jenkins" {
  name                 = "jenkinsSubnet" 
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = [var.subnet_jenkins_cidr] # Minimum /26 CIDR block required for Bastion
}
