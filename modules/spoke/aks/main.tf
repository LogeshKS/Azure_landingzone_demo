resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.spokergname
  dns_prefix          = local.stack_name
  kubernetes_version  = "1.19.6"

  linux_profile {
    admin_username = var.node_admin_username

    ssh_key {
      key_data = data.azurerm_key_vault_secret.pub.value
    }
  }

  default_node_pool {
    name                 = format("aks${var.environment}pool")
    node_count           = local.env_node_count
    max_pods             = var.env_aks_max_pod_number
    type                 = "VirtualMachineScaleSets"
    vm_size              = local.env_node_size
    os_disk_type         = "Ephemeral"
    vnet_subnet_id       = azurerm_subnet.aks.id
    orchestrator_version = "1.19.6"
    availability_zones   = ["1", "2"]
    tags                 = local.env_tags
  }

  service_principal {
    client_id     = azuread_service_principal.aks.application_id
    client_secret = azuread_service_principal_password.aks.value
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "azure"
  }

  tags = local.env_tags
}