terraform {
  backend "azurerm" {
    resource_group_name   = var.backend_rg
    storage_account_name  = "tfstatebackend"   # Change to your storage account name
    container_name        = "tfstate"          # Change to your container name
    key                   = "prod.terraform.tfstate"
  }
}