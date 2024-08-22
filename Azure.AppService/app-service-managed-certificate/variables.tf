variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "dns_zone_name" {
  description = "The name of the DNS Zone."
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

variable "dns_txt_record_name" {
  description = "The name of the DNS TXT Record."
  type        = string
}

variable "" {
  description = ""
  type        = string
}

variable "" {
  description = ""
  type        = string
}

variable "" {
  description = ""
  type        = string
}

variable "" {
  description = ""
  type        = string
}
