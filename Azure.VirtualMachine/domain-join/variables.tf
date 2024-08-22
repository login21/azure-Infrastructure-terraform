variable "domain_join_name" {
    description = "The name of the virtual machine extension peering. Changing this forces a new resource to be created."
    type = string
}

variable "domain_join_virtual_machine_id" {
    description = "The ID of the Virtual Machine."
    type = string
}

variable "domain_join_publisher" {
    description = "The publisher of the extension, available publishers can be found by using the Azure CLI."
    type = string
}

variable "domain_join_type" {
    description = " The type of extension, available types for a publisher can be found using the Azure CLI."
    type = string
}

variable "domain_join_type_handler_version" {
    description = "Specifies the version of the extension to use, available versions can be found using the Azure CLI."
    type = string
}

variable "domain_join_auto_upgrade_minor_version" {
    description = "Specifies if the platform deploys the latest minor version update to the type_handler_version specified."
    type = bool
}

variable "active_directory_domain" {
    description = "The name of the Active Directory domain to join"
    type = string
}

variable "ou_path" {
    description = "An organizational unit (OU) within an Active Directory to place computers"
    default = null
}

variable "active_directory_username" {
    description = "The username of an account with permissions to bind machines to the Active Directory Domain"
    type = string
}

variable "active_directory_password" {
    description = "The password of the account with permissions to bind machines to the Active Directory Domain"
    type = string
}

variable "tags" {
    description = "A mapping of tags to assign to the resource."
    type = map(string)
}