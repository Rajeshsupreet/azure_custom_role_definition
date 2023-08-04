terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm" #3.59.0
      version = ">= 3.59.0"
    }
  }
  required_version = ">= 1.2.0"
}