provider "azurerm" {
  features {}

  skip_provider_registration = "true"
}

resource "azurerm_resource_group" "rg" {
  location = var.az_rg_location
  name = var.az_rg_name
}

resource "azurerm_app_service_plan" "plan" {
  name = "pgr301exam"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind = "Linux"
  reserved = "true"

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "app_srv" {
  name = var.az_app_web_srv_label
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id


  site_config {
    use_32_bit_worker_process = "true"
    linux_fx_version = "DOCKER|${var.az_container_registry_url}/${var.az_acr_img}"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DOCKER_REGISTRY_SERVER_URL" = var.az_container_registry_url
    "DOCKER_REGISTRY_SERVER_USERNAME" = var.az_client_id
    "DOCKER_REGISTRY_SERVER_PASSWORD" = var.az_client_secret
    "LOGZ_TOKEN" = var.logz_token
    "LOGZ_URL" = var.logz_url
  }
}

output "url" {
  value = "${azurerm_app_service.app_srv.name}.azurewebsites.net"
}