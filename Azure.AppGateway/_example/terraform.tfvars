# -------------------------------------------------------------
# Resource Group variables
# -------------------------------------------------------------
resource_group_name = "test-appgateway"
location            = "australiaeast"
tags = {
  environment = "dev",
  project     = "test"
}

vnet_resource_group_name = "test-01-vnet"
vnet_name                = "vnet-test-syd-01"
subnet_id              = "PublicSubnetNonPrd"

# -------------------------------------------------------------
# App Gateway variables
# -------------------------------------------------------------
name = "appgw-test-syd-01"
sku = {
  name = "WAF_v2"
  tier = "WAF_v2"
}

public_ip_name     = "pip-test-syd-01-bastion"
allocation_method  = "Static"
public_ip_sku      = "Standard"
public_ip_sku_tier = "Regional"

#gateway_ip_configuration_name = "gw-ipconfig-dev-01"
#frontend_ip_configuration_name = "fe-ipconfig-dev-01"

autoscale_configuration = {
  min_capacity = 1
  max_capacity = 15
}

/* frontend_port = {
  name = "feport-dev-01"
  port = 80
} */

## ****** Backend Address Pool ********* 

backend_address_pools = [
  {
    name  = "appgw-testgateway-australiaeast-bapool01"
    fqdns = ["webapp-test-external.azurewebsites.net", ]
  },
  {
    name         = "appgw-testgateway-australiaeast-bapool02"
    ip_addresses = ["1.2.3.4", "2.3.4.5"]
  }
]

## ****** Backend Http setting *********
backend_http_settings = [
  {
    name                  = "appgw-testgateway-australiaeast-be-http-set1"
    cookie_based_affinity = "Disabled"
    path                  = "/"
    enable_https          = false
    request_timeout       = 30
    
    connection_draining = {
      enable_connection_draining = true
      drain_timeout_sec          = 300

    }
  },
  {
    name                  = "appgw-testgateway-australiaeast-be-http-set2"
    cookie_based_affinity = "Disabled"
    path                  = "/"
    enable_https          = false
    request_timeout       = 30
  }
]


## ****** Http Listener setting *********
http_listeners = [
  {
    name = "appgw-testgateway-australiaeast-be-htln01"
    #ssl_certificate_name = "appgw-testgateway-australiaeast-ssl01"
    #host_name            = null
    protocol = "Http"
  }
]

request_routing_rules = [
  {
    name                       = "appgw-testgateway-australiaeast-be-rqrt"
    rule_type                  = "Basic"
    priority                   = 100
    http_listener_name         = "appgw-testgateway-australiaeast-be-htln01"
    backend_address_pool_name  = "appgw-testgateway-australiaeast-bapool01"
    backend_http_settings_name = "appgw-testgateway-australiaeast-be-http-set1"
  }
]


## ****** WAF Configuration *********
waf_configuration = {
  firewall_mode            = "Detection"
  rule_set_version         = "3.1"
  file_upload_limit_mb     = 100
  max_request_body_size_kb = 128

  disabled_rule_group = [
    {
      rule_group_name = "REQUEST-930-APPLICATION-ATTACK-LFI"
      rules           = ["930100", "930110"]
    },
    {
      rule_group_name = "REQUEST-920-PROTOCOL-ENFORCEMENT"
      rules           = ["920160"]
    }
  ]

  exclusion = [
    {
      match_variable          = "RequestCookieNames"
      selector                = "SomeCookie"
      selector_match_operator = "Equals"
    },
    {
      match_variable          = "RequestHeaderNames"
      selector                = "referer"
      selector_match_operator = "Equals"
    }
  ]
}


