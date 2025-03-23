# Network Security Group (NSG) for Jenkins (Restrict access only from Bastion)
resource "azurerm_network_security_group" "jenkins" {
  name                = "jenkins-nsg"
  location            = var.location
  resource_group_name = var.hub_rg_name

  security_rule {
    name                       = "AllowBastionSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = [var.bastion_subnet_cidr]
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "DenyAllInbound"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "jenkins" {
  network_interface_id      = azurerm_network_interface.jenkins.id
  network_security_group_id = azurerm_network_security_group.jenkins.id
}
