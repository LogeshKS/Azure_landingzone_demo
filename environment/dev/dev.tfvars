environment = "dev"
hub_rg_name = "hub_rg"
hub_location = "eastus"
spoke_rg_name = "spoke_rg"
spoke_location = "centralus"
hub_tags = ""
spoke_tags = ""
backend_rg = "backend_rg"
backend_location = "eastus"
backend_tags = ""
ddosname = "dev-ddos"
hubname = "hub"
hubvnet_cidr = "10.0.0.0/16"
spokevnet_cidr = 
subnet_bastion_cidr = "10.0.1.0/22"
subnet_aks_cidr = "10.0.3.0/22"
subnet_waf_cidr = "10.0.0.0/22"
subnet_jenkins_cidr = "10.0.2.0/22"
vnet_spoke_to_peer = ["hub-and-spoke-aks-dev",]
acr_id = ""
aks_id = ""
jenkins_tags = ""
spokevpcname = "spoke"
aks_cluster_name = ""
dns_prefixname = ""
node_admin_username = ""
max_pods = ""
env_node_size = ""
aks_envtag = ""
acr_envtags = ""
agw_stackname = ""
appgw_tags = ""


