resource "azurerm_virtual_machine_extension" "vm_extension" {
  name                 = var.domain_join_name
  virtual_machine_id   = var.domain_join_virtual_machine_id
  publisher            = var.domain_join_publisher
  type                 = var.domain_join_type
  type_handler_version = var.domain_join_type_handler_version
  auto_upgrade_minor_version = var.domain_join_auto_upgrade_minor_version
  settings = <<SETTINGS
    {
        "Name": "${var.active_directory_domain}",
        "OUPath": "${var.ou_path != null ? var.ou_path : ""}",
        "User": "${var.active_directory_username}@${var.active_directory_domain}",
        "Restart": "true",
        "Options": "3"
    }
SETTINGS

  protected_settings = <<SETTINGS
    {
        "Password": "${var.active_directory_password}"
    }
SETTINGS
}