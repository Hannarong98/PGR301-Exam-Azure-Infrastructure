terraform {
  backend "azurerm" {
    resource_group_name = "pgr301-exam-rg"
    storage_account_name = "pgr301sa"
    container_name = "tfstate"
    key = "prod.terraform.tfstate"
  }
}

