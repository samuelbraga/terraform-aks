provider "azuread" {
    
}

provider "azurerm" {
    version = "~>2.0"
    skip_provider_registration = true
    features {}
}

terraform {
    backend "azurerm" {}
}
