# -------------------------------------------------------------
# Resource Group variables
# -------------------------------------------------------------
variable "resource_group_name" {
  description = "The name of resource group to be created."
  type        = string
}

# -------------------------------------------------------------
# DCR variables
# -------------------------------------------------------------
variable "dcr_name" {
  description = "The name of resource group to be created."
  type        = string
}

# -------------------------------------------------------------
# DCR Association variables
# -------------------------------------------------------------
variable "dcr_association_name" {
  description = "The name which should be used for this Data Collection Rule Association."
  type        = string
}

variable "target_resource_id" {
  description = "The ID of the Azure Resource which to associate to a Data Collection Rule"
  type        = string
}

variable "data_collection_rule_id" {
  description = "value"
  type        = string

}

variable "description" {
  description = "The description of the Data Collection Rule Association."
  type        = string
}