variable "environment" {
  type = string 
}

variable "spoke_rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "env_tags" {
  type = map(string)
}