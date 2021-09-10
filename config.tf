terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
  



  backend "azurerm" {
    resource_group_name  = "tf-backend"
    storage_account_name = "tfstatestorage2021"
    container_name       = "tf-states"
    key                  = "terraform.tfstates"
  }
}

provider "azurerm" {
  alias   = "azurerm1"
  version = ">= 1.44"
  features {}
}

#Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}