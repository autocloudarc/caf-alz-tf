terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # Check for latest version at: https://registry.terraform.io/providers/hashicorp/azurerm/latest
      version = ">= 3.20.0"
    }
  }
}
provider "azurerm" {
  features {}
}
provider "azurerm" {
  alias           = "corp"
  subscription_id = var.uslzSubscriptionId
  features {}
}
provider "azurerm" {
  alias           = "connectivity"
  subscription_id = var.connectivitySubscriptionId
  features {}
}
provider "azurerm" {
  alias           = "management"
  subscription_id = var.managementSubscriptionId
  features {}
}
provider "azurerm" {
  alias           = "identity"
  subscription_id = var.identitySubscriptionId
  features {}
}
provider "azurerm" {
  alias           = "sandbox"
  subscription_id = var.sandboxSubscriptionId
  features {}
}
