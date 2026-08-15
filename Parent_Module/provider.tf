terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "f2dc6b00-339e-4bbb-8625-7ff34e04e886"
}
