variable "aks_cluster_name" {
  type = string
}
variable "location" {
  type = string
}
variable "spokergname" {
  type = string
}
variable "dns_prefixname" {
  type = string
}
variable "node_admin_username" {
  type = string
}
variable "environment" {
  type = string
}
variable "env_aks_max_pod_number" {
  
}
variable "env_node_size" {
  
}
variable "env_tags" {
  type = map(string)
}

variable "aks_subnetid" {
  
}
