variable "location" {
  type    = string
  default = "francecentral"
}
variable "project" {
  type    = string
  default = "hub-and-spoke"
}
variable "application" {
  type    = string
  default = "hub"
}

locals {
  stackname = "${var.application}"
}
variable "rg_name" {
  type = string
}
variable "bastion_subnetid" {
  
}
variable "env" {
  type = string
}