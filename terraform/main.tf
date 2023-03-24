terraform {
  required_version = ">= 0.12"
 required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider azurerm {
  features {}
}

resource "azurem_resource_group" "rg" {
  name = "rg-first"
  location = "West Europ"
}
