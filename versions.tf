terraform {
  required_version = ">= 1.1"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.39.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.59.0"
    }
  }
}