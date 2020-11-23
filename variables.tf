
variable "az_rg_location" {
  description = "Location of your resource group"
  default = "West Europe"
}

variable "az_rg_name" {
  description = "Name of your resource group"
  default = "pgr301-exam-rg"
}

variable "az_acr_img" {
  description = "Container registry image tag/name"
  default = "7b582d7462018020f4ca46a38ed46bd53f30c267"
}

variable "az_app_web_srv_label" {
  description = "Label for your website in azure app service dashboard (alphanumeric) only"
  default = "pgr301exam"
}

variable "status_cake_website_name" {
  description = "Name of your website"
  type = string
  default = "pgr301-azure"
}

variable "status_cake_check_rate" {
  description = "Check rate frequency in seconds"
  type = number
  default = 300
}

variable "status_cake_contact_group" {
  description = "Array of contact group id's adjust the tuple type comma separated for more group id's"
  type = tuple([string])
  default = ["195453"]
}

variable "logz_token" {
  description = "Token for logz.io"
}

variable "logz_url" {
  description = "Listener url for logz.io"
}

variable "status_cake_username" {
  description = "Username for statuscake"
}

variable "status_cake_api_key" {
  description = "Api key for statuscake"
}

variable "az_subscription_id" {
  description = "Your subscription id"
}

variable "az_client_id" {
  description = "AppId or ClientId of Service Principal"
}

variable "az_client_secret" {
  description = "Password or Secret of Service Principal"
}

variable "az_tenant_id" {
  description = "Your tenantId, see Azure AD"
}

variable "az_container_registry_url" {
  description = "Your azure container registry server url"
}
