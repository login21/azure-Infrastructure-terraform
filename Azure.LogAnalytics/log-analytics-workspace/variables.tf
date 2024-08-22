variable "resource_group_name" {
  description = "The name of resource group to be created."
  type        = string
}

variable "name" {
  description = "Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol. Changing this forces a new resource to be created."
  type        = string
}

variable "sku" {
  description = "Specifies the SKU of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018 (new SKU as of 2018-04-03). Defaults to PerGB2018"
  type        = string
}

variable "retention_in_days" {
  description = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}


# variable "disk_thresholds_severity" {
#   description = "mapping of thresholds and alert severity rating for disk"
#   type        = map(number)
#   default = {
#     10 = 1
#     20 = 2
#     30 = 3
#   }
# }

# variable "memory_thresholds_severity" {
#   description = "mapping of thresholds and alert severity rating for memory"
#   type        = map(number)
#   default = {
#     10 = 1
#     20 = 2
#     30 = 3
#   }
# }

# variable "cpu_thresholds_severity" {
#   description = "mapping of thresholds and alert severity rating for CPU utilisation"
#   type        = map(number)
#   default = {
#     90 = 1
#     80 = 2
#     70 = 3
#   }
# }

# locals {
#   virtual_node_ips = [azurerm_network_interface.new_cassandra_nics.*.private_ip_address]
#   tags = {
#     "environment" = "${var.prefix}"
#   }
# }
