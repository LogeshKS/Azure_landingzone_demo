terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.50.0" # Update to latest stable version
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.50.0" # Update as needed
    }
  }
}
provider "azurerm" {
  features {}
}
