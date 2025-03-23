# Vnet peering for spokes
#What this does?
# Retrieves details of existing Spoke VNets based on a list (var.vnet_spoke_to_peer).
# Each spoke VNet must already exist and be managed under separate resource groups.

data "azurerm_virtual_network" "spoke" {
  for_each            = toset(var.vnet_spoke_to_peer)
  name                = each.key
  resource_group_name = each.key
}


#hub to spoke peering
resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  for_each                  = toset(var.vnet_spoke_to_peer)
  name                      = "hub-to-${each.key}"
  resource_group_name       = var.rg_name
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = data.azurerm_virtual_network.spoke[each.key].id
}

#spoke to hub peering

resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  for_each                  = toset(var.vnet_spoke_to_peer)
  name                      = "${each.key}-to-hub"
  resource_group_name       = each.key
  virtual_network_name      = data.azurerm_virtual_network.spoke[each.key].name
  remote_virtual_network_id = var.hub_vnet_id
}