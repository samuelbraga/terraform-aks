provider "azuread" {
  version = "=0.7.0"
}

provider "azurerm" {
  version = "~>2.0"
  features {}
}

terraform {
  backend "azurerm" {}
}
