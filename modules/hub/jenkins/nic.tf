# Network Interface for Jenkins VM (No Public IP)
resource "azurerm_network_interface" "jenkins" {
  name                = "jenkins-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.jenkins_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}