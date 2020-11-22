terraform {
  backend "azurerm" {
    resource_group_name = "pgr301-exam-hannarong98"
    storage_account_name = "klihan18sa"
    container_name = "tfstate"
    key = "prod.terraform.tfstate"
  }
}

