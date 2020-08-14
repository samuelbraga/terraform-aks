provider "azuread" {
  version = "=0.7.0"
}

provider "azurerm" {
  version = "~>2.0"
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name   = "lab-pedro"
    storage_account_name  = "storageterraformdti"
    container_name        = "terraform"
    key                   = "terraform.samuel.tfstate"
  }
}

# export ARM_ACCESS_KEY=1OHlR/DEsqVCEaifxbyod7kYxrhqDHQUP5J+vdmFx0yECQvCtSmgA/e+Ja1HyB/Fjd8kwnLfkcKzvoPmjIUiRw==
