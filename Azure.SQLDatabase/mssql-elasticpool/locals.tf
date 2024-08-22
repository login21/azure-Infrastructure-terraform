locals {

  default_sku = {
    name     = "BasicPool",
    tier     = "Basic",
    capacity = 100
  }

  default_per_database_settings = {
    min_capacity = 0,
    max_capacity = 5
  }
}
