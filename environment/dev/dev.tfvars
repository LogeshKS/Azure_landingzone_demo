environment = "dev"
hub_rg_name = "hub_rg"
hub_location = "eastus"
spoke_rg_name = "spoke_rg"
spoke_location = "centralus"
hub_tags = {
    Project     = "hub-and-spoke"
    Application = "hub"
    Automate    = "terraform"
    Customer    = "all"
    Environment = "common"
  }
spoke_tags = {
    Project     = "hub-and-spoke"
    Application = "aks"
    Automate    = "terraform"
    Customer    = "all"
}

ddosname = "ddos"
hubname = "hub"
hubvnet_cidr = "10.0.0.0/16"
spokevnet_cidr = "10.1.0.0/16"
subnet_bastion_cidr = "10.0.4.0/22"
subnet_aks_cidr = "10.1.0.0/17"
subnet_waf_cidr = "10.0.0.0/22"
subnet_jenkins_cidr = "10.0.5.0/22"
vnet_spoke_to_peer = ["hub-and-spoke-aks-dev",]
spokevpcname = "spoke"
aks_cluster_name = "aks-cluster"
dns_prefixname = "dev-hubspoke"
max_pods = "100"
env_node_size = "standard_ds3_v2"
agw_stackname = "dev"
appgw_tags = {
    Project     = "hub-and-spoke"
    Application = "hub"
    Automate    = "terraform"
    Customer    = "all"
    Environment = "common"
  }

 domain = "lokicloud.in" 
exposeddns = {
    "app-dev" = {
      "dns"       = "lokicloud.in"
      "env"       = "dev"
      "protocol" = "Http"
    }
  }
aks_private_lb_ip = "10.1.127.200"


