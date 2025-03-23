variable "stack_name" {
  type = string
}
variable "location" {
  type = string
}
variable "default_tags" {
  type = map(string)
}
variable "hub_rg_name" {
  type = string
}
variable "exposed_dns" {
  
}
variable "domain" {
  
}
variable "waf_subnet_id" {
  type = string
}
variable "aks_private_lb_ip" {
  
}