locals {
  environment = "dev"
  instance    = "01"
  project     = "test"
  location    = "Australia East"


  tags = {
    Department      = "IT"
    Environment     = "dev"
    Product         = "test"
    Project         = "test"
    ProvisionMethod = "Terraform"
  }

  timeouts = {
    create = "60m"
    delete = "60m"
    read   = "5m"
    update = "60m"
  }

}
