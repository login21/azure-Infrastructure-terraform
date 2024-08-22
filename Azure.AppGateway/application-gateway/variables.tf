variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "location" {
  description = "The location of the resource."
  type        = string
}

/* variable "vnet_resource_group_name" {
  description = "The Name of Resource Group for vnet."
  type        = string
}

variable "vnet_name" {
  description = "Specifies the name of the vnet."
  type        = string
} */

variable "subnet_id" {
  description = "Id of subnet where application gateway will be created."
  type        = string
}

# variable "public_ip_names" {
#   description = "A list of public subnets inside the vNet."
#   type        = string
# }

# variable "keyvault_name" {
#   description = "Specifies the name of the Key Vault."
#   type        = string
# }

# variable "vault_certificate_name" {
#   description = "Specifies the name of the Key Vault Certificate."
#   type        = string
# }

variable "name" {
  description = "The name of the Application Gateway. "
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}

variable "firewall_policy_id" {
  description = "The ID of the Web Application Firewall Policy which can be associated with app gateway"
  default     = null
}

variable "autoscale_configuration" {
  description = "Minimum or Maximum capacity for autoscaling. Accepted values are for Minimum in the range 0 to 100 and for Maximum in the range 2 to 125"
  type = object({
    min_capacity = number
    max_capacity = optional(number)
  })
  default = null
}

variable "sku" {
  description = "The SKU details for the Application Gateway."
  type = object({
    name     = string
    tier     = string
    capacity = optional(number)
  })
}

# variable "gateway_ip_configuration_name" {
#   description = "The Name of this Gateway IP Configuration."
#   type        = string
# }

# variable "gateway_ip_configurations" {
#   description = "value"
#   type = object({
#     name = string
#   })
# }

# variable "frontend_ip_configuration_name" {
#   description = "The name of the Frontend IP Configuration."
#   type        = string
#   # type        = set(string)
# }

variable "frontend_public_ip_id" {
  description = "ID of public IP for app gateway."
  type        = string
  # type        = set(string)
}

/* variable "frontend_port" {
  description = "The SKU details for the Application Gateway."
  type = object({
    name = string
    port = number
  })
} */

variable "backend_address_pools" {
  description = "List of backend address pools"
  type = list(object({
    name         = string
    fqdns        = optional(list(string))
    ip_addresses = optional(list(string))
  }))
}

variable "backend_http_settings" {
  description = "List of backend HTTP settings."
  type = list(object({
    name                                = string
    cookie_based_affinity               = string
    affinity_cookie_name                = optional(string)
    path                                = optional(string)
    enable_https                        = bool
    probe_name                          = optional(string)
    request_timeout                     = number
    host_name                           = optional(string)
    pick_host_name_from_backend_address = optional(bool)
    authentication_certificate = optional(object({
      name = string
    }))
    trusted_root_certificate_names = optional(list(string))
    connection_draining = optional(object({
      enable_connection_draining = bool
      drain_timeout_sec          = number
    }))
  }))
}

variable "http_listeners" {
  description = "List of HTTP/HTTPS listeners. SSL Certificate name is required"
  type = list(object({
    name                 = string
    host_name            = optional(string)
    host_names           = optional(list(string))
    require_sni          = optional(bool)
    ssl_certificate_name = optional(string)
    firewall_policy_id   = optional(string)
    ssl_profile_name     = optional(string)
    custom_error_configuration = optional(list(object({
      status_code           = string
      custom_error_page_url = string
    })))
  }))
}

variable "request_routing_rules" {
  description = "List of Request routing rules to be used for listeners."
  type = list(object({
    name                        = string
    rule_type                   = string
    http_listener_name          = string
    priority                    = number
    backend_address_pool_name   = optional(string)
    backend_http_settings_name  = optional(string)
    redirect_configuration_name = optional(string)
    rewrite_rule_set_name       = optional(string)
    url_path_map_name           = optional(string)
  }))
  default = []
}

# variable "ssl_certificates" {
#   description = "List of SSL certificates data for Application gateway"
#   type = list(object({
#     name                = string
#     data                = optional(string)
#     password            = optional(string)
#     key_vault_secret_id = optional(string)
#   }))
#   default = []
# }

variable "url_path_maps" {
  description = "App Gateway settings for path based routing"
  type = object({
    name                               = string
    default_backend_address_pool_name  = string
    default_backend_http_settings_name = string
    path_rules = list(object({
      name                       = string
      paths                      = list(string)
      backend_address_pool_name  = string
      backend_http_settings_name = string
    }))
  })
  default = null
}

variable "health_probes" {
  description = "List of Health probes used to test backend pools health."
  type = list(object({
    name                                      = string
    host                                      = optional(string)
    interval                                  = number
    protocol                                  = string
    path                                      = string
    timeout                                   = number
    unhealthy_threshold                       = number
    port                                      = optional(number)
    pick_host_name_from_backend_http_settings = optional(bool)
    minimum_servers                           = optional(number)
    match = optional(object({
      body        = optional(string)
      status_code = optional(list(string))
    }))
  }))
  default = []
}

variable "waf_configuration" {
  description = "Web Application Firewall support for your Azure Application Gateway"
  type = object({
    firewall_mode            = string
    rule_set_version         = string
    file_upload_limit_mb     = optional(number)
    request_body_check       = optional(bool)
    max_request_body_size_kb = optional(number)
    disabled_rule_group = optional(list(object({
      rule_group_name = string
      rules           = optional(list(string))
    })))
    exclusion = optional(list(object({
      match_variable          = string
      selector_match_operator = optional(string)
      selector                = optional(string)
    })))
  })
  default = null
}
