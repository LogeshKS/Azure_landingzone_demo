resource "azurerm_public_ip" "bastion" {
  name                = "bastion_publicip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard" # Required for Bastion
}

resource "azurerm_bastion_host" "bastion_hub" {
  name                = "${local.stackname}-bastion"
  location            = var.location
  resource_group_name = var.rg_name

  sku = "standard"

  ip_configuration {
    name                 = "bastion-ip-config"
    subnet_id            = var.bastion_subnetid
    public_ip_address_id = azurerm_public_ip.bastion.id
  }
}
