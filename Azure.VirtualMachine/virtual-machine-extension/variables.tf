variable "name" {
    description = "The name of the virtual machine extension peering. Changing this forces a new resource to be created."
    type = string
}

variable "virtual_machine_id" {
    description = "The ID of the Virtual Machine."
    type = string
}

variable "publisher" {
    description = "The publisher of the extension, available publishers can be found by using the Azure CLI."
    type = string
}

variable "type" {
    description = " The type of extension, available types for a publisher can be found using the Azure CLI."
    type = string
}

variable "type_handler_version" {
    description = "Specifies the version of the extension to use, available versions can be found using the Azure CLI."
    type = string
}

variable "auto_upgrade_minor_version" {
    description = "Specifies if the platform deploys the latest minor version update to the type_handler_version specified."
    type = bool
}

variable "automatic_upgrade_enabled" {
    description = "Should the Extension be automatically updated whenever the Publisher releases a new version of this VM Extension?"
    type = bool
}

variable "settings" {
    description = "Should the Extension be automatically updated whenever the Publisher releases a new version of this VM Extension?"
    type = string
    default = null
}

# variable "active_directory_domain" {
#     description = "The name of the Active Directory domain to join"
#     type = string
#     default = null
# }

# variable "ou_path" {
#     description = "An organizational unit (OU) within an Active Directory to place computers"
#     default = null
# }

# variable "active_directory_username" {
#     description = "The username of an account with permissions to bind machines to the Active Directory Domain"
#     type = string
#     default = null
# }

# variable "active_directory_password" {
#     description = "The password of the account with permissions to bind machines to the Active Directory Domain"
#     type = string
#     default = null
# }

variable "tags" {
    description = "A mapping of tags to assign to the resource."
    type = map(string)
}