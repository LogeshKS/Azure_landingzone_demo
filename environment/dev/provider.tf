terraform {
  required_providers {
    azurerm = {
      source  = "azurerm"
      version = "= 2.45.1"
    }
    azuread = {
      source  = "azuread"
      version = "= 1.3.0"
    }
  }
}