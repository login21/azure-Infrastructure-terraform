variable "name" {
  description = "The name of resource group to be created."
  type        = string
}

variable "location" {
  description = "The name of resource group to be created."
  type        = string
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)

  default = {
    environment = "dev"
  }
}

variable "timeouts" {
  default = {
    create = "60m"
    delete = "60m"
    read   = "5m"
    update = "60m"
  }

  description = "Timeout settings."
  type        = map(string)
}
