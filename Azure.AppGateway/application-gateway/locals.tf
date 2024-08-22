locals {
  sku = {
    name = "WAF_v2",
    tier = "WAF_v2"
  }

  backend_address_pools = {
    name         = "test1"
    fqdns        = []
    ip_addresses = []
  }
}
