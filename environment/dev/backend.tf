terraform {
  backend "azurerm" {
    resource_group_name   = "tf-backend"
    storage_account_name  = "terraformstorage21"   # Change to your storage account name
    container_name        = "hubspokecontainer"         # Change to your container name
    key                   = "aks/terraform.tfstate"
  }
}