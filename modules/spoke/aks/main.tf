resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.spokergname
  dns_prefix          = var.dns_prefixname
  kubernetes_version  = "1.27.3" # Update to the latest supported version

  api_server_access_profile {
    authorized_ip_ranges = [azurerm_network_interface.jenkins.private_ip_address]

  }

  default_node_pool {
    name                 = format("aks%s-pool", var.environment)
    auto_scaling_enabled = true
    min_count            = 1
    max_count            = 5
    max_pods             = var.env_aks_max_pod_number
    type                 = "VirtualMachineScaleSets"
    vm_size              = var.env_node_size
    os_disk_type         = "Ephemeral"
    vnet_subnet_id       = var.aks_subnetid
    orchestrator_version = "1.27.3" # Match cluster version
    zones                = ["1","2"]
    
  }

  identity {
    type = "SystemAssigned" # Recommended over service principal
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "azure"
  }

 
}
