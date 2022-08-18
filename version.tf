terraform {
  required_version  = ">= 1.2.6"

  required_providers {
    azurerm         = {
      source        = "hashicorp/azurerm"
      version       = ">= 3.18.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
