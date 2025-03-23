locals {
  env =var.environment
}

#defining resource gorup for hub
module "hub_rg"{
    source = "../../modules/resource_group"

    rg_name = var.hub_rg_name
    location = var.hub_location
    tags = var.hub_tags
}

#defining resource gorup for Spoke
module "Spoke_rg"{
    source = "../../modules/resource_group"

    rg_name = var.spoke_rg_name
    location = var.spoke_location
    tags = var.spoke_tags
}

#denining backend rg
module "backend_rg" {
    source = "../../modules/resource_group"

    rg_name = var.backend_rg
    location = var.backend_location
    tags = var.backend_tags
}

#defining hubVNET
module "hubVnet" {
    source = "../../modules/hub/vnet"

    env = var.environment
    ddosname = var.ddosname 
    hubname = var.hubname
    location = var.hub_location
    rgname = var.hub_rg_name
    hubvnet_cidr = [var.hubvnet_cidr]
    hubvnet_tags = var.hub_tags

    subnet_waf_cidr = [var.subnet_waf_cidr]
    subnet_bastion_cidr = [var.subnet_bastion_cidr]
    subnet_jenkins_cidr = [var.subnet_jenkins_cidr]

}

#defining vnet peering
module "vnet_peering" {
     source = "../../modules/hub/vnet_peering"
     
     vnet_spoke_to_peer = var.vnet_spoke_to_peer
     rg_name = var.hub_rg_name
     hub_vnet_name = module.hubVnet.vnet_name
     hub_vnet_id = module.hubVnet.vnet_id
}

#defining bastion
module "bastion" {
    source = "../../modules/hub/bastion"

    location = var.hub_location
    rg_name = var.hub_rg_name
    bastion_subnetid = [var.subnet_bastion_cidr]
    env = var.environment
}

#defining Jenkins VM

module "Jenkins" {
    source = "../../modules/hub/jenkins"

    location = var.hub_location
    hub_rg_name = var.hub_rg_name
    jenkins_subnet_id = [var.subnet_jenkins_cidr]

    #nsg
    bastion_subnet_cidr = [var.subnet_bastion_cidr]

    acr_id = var.acr_id #need to correct
    aks_id = var.aks_id

    default_tags = var.jenkins_tags
}

#defining spoke Vnet

module "spokevnet"{
    source = "../../modules/spoke/vnet"

    spokevpcname = var.spokevpcname
    spokelocation = var.spoke_location
    spokergname = var.spoke_rg_name
    spokevnet_cidr = [var.spokevnet_cidr]
    spokevnet_tags = var.spoke_tags

    subnet_aks_cidr = [var.subnet_aks_cidr]

}

#defining AKS

module "Aks" {

    source = "../../modules/spoke/aks"

    aks_cluster_name = var.aks_cluster_name
    location = var.spoke_location
    spokergname = var.spoke_rg_name
    dns_prefixname = var.dns_prefixname
    node_admin_username = var.node_admin_username
    env_aks_max_pod_number = var.max_pods
    env_node_size = var.env_node_size
    aks_subnetid = [var.subnet_aks_cidr]
    env_tags = var.aks_envtag
    environment = var.environment
  
}

#defining ACR
module "acr" {
    source = "../../modules/spoke/acr"

    environment = var.environment
    spoke_rg_name = var.spoke_rg_name
    location = var.spoke_location

    env_tags = var.acr_envtags
}

#defining app_gateway

module "agw"{
    source = "../../modules/hub/app_gateway"

    stack_name = var.agw_stackname
    hub_rg_name = var.hub_rg_name
    location = var.hub_location
    default_tags = var.appgw_tags
    waf_subnet_id = [var.subnet_waf_cidr]
    domain = ""
    exposed_dns ="" 
}
    


