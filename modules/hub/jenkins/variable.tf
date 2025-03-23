variable "location" {
  type = string
}
variable "hub_rg_name" {
  type = string
}
variable "default_tags" {
  type = map(string)
}
variable "jenkins_subnet_id" {
  type = string
}
variable "bastion_subnet_cidr" {
  type = string
}
variable "acr_id" {
  type = string
}
variable "aks_id" {
  type = string
}