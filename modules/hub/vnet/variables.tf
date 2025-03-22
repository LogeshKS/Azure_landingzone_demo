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
  type = map(string)
}

variable "subnet_waf_cidr" {
  type = string
}

variable "subnet_bastion_cidr" {
  type = string
}