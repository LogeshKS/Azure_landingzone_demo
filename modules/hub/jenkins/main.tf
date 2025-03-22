# Azure Virtual Machine for Jenkins

resource "azurerm_linux_virtual_machine" "jenkins" {
  name                  = "jenkins-vm"
  location              = var.location
  resource_group_name   = var.hub_rg_name
  network_interface_ids = [azurerm_network_interface.jenkins.id]
  size                  = "Standard_DS2_v2"  # Adjust based on workload


  admin_username = "azureuser"

  identity {
    type = "SystemAssigned"
  }

  secure_boot_enabled = true

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  tags = var.default_tags

   custom_data = base64encode(<<EOF
    #!/bin/bash
    apt update && apt install -y azure-cli
    sudo apt update
    sudo apt install curl -y
    sudo curl -LO "https://dl.k8s.io/release/v1.28.4/bin/linux/amd64/kubectl"
    sudo chmod +x kubectl
    sudo mv kubectl /usr/local/bin/
    sudo snap install helm --classic
    curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/download/v2.7.3/argocd-linux-amd64
    chmod +x argocd-linux-amd64
    sudo mv argocd-linux-amd64 /usr/local/bin/argocd
    EOF
  )
}




