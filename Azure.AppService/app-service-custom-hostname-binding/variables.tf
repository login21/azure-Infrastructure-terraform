variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "service_plan_name" {
  description = "The name which should be used for this Windows Function App. Changing this forces a new Windows Function App to be created. Limit the function name to 32 characters to avoid naming collisions."
  type        = string
}

variable "web_app_name" {
  description = "The name which should be used for this Windows Web App. Changing this forces a new Windows Web App to be created."
  type        = string
}

variable "hostname" {
  description = "Specifies the Custom Hostname to use for the App Service, example www.example.com."
  type        = string
}
