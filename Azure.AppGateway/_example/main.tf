# -------------------------------------------------------------
# Resource Group
# -------------------------------------------------------------
module "resource_group" {
  source = "../../Azure.ResourceGroup"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "public_ip" {

  source = "../../Azure.Network/public-ip"

  depends_on = [module.resource_group]

  name                = var.public_ip_name
  resource_group_name = module.resource_group.name
  allocation_method   = var.allocation_method
  sku                 = var.public_ip_sku
  sku_tier            = var.public_ip_sku_tier
  tags                = var.tags

}


# -------------------------------------------------------------
# App Gateway
# -------------------------------------------------------------
module "app_gateway" {
  source = "../application-gateway"
  depends_on = [
    module.resource_group
  ]

  name                           = var.name
  resource_group_name            = module.resource_group.name
  location =  var.location
  subnet_id                    = var.subnet_id
  tags                           = var.tags
  sku                            = var.sku
  autoscale_configuration        = var.autoscale_configuration
  frontend_public_ip_id          = module.public_ip.id
  backend_address_pools          = var.backend_address_pools
  backend_http_settings          = var.backend_http_settings
  http_listeners                 = var.http_listeners
  request_routing_rules          = var.request_routing_rules

  waf_configuration              = var.waf_configuration

}
