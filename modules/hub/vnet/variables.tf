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

variable "env" {
  
}

variable "hubname" {
  
}
variable "ddosname" {
  
}

locals {
  stackname = "${var.project}-${var.application}"
}

variable "rgname" {
  type = string
}
variable "location" {
  type = string
}

variable "hubvnet_cidr" {
  type = string
}

variable "hubvnet_tags" {
  type = map
  default = {
    Project     = "hub-and-spoke"
    Application = "hub"
    Automate    = "terraform"
    Customer    = "all"
    Environment = "common"
  }
}

variable "subnet_waf_cidr" {
  type = string
}

variable "subnet_bastion_cidr" {
  type = string
}
variable "subnet_jenkins_cidr" {
  type = string
}