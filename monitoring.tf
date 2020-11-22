provider "statuscake" {
  username = var.status_cake_username
  apikey = var.status_cake_api_key
}

resource "statuscake_test" "azure" {
  test_type = "HTTP"
  website_name = var.status_cake_website_name
  website_url = "${azurerm_app_service.app_srv.name}.azurewebsites.net"
  check_rate = var.status_cake_check_rate
  contact_group = var.status_cake_contact_group
}

terraform {
  required_providers {
    statuscake = {
      source = "terraform-providers/statuscake"
    }
  }
}