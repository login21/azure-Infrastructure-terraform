# -------------------------------------------------------------
# Resource Group
# -------------------------------------------------------------
module "resource_group" {
  source = "../../Azure.ResourceGroup"
  name     = var.name
  location = var.location
  tags     = var.tags
}

# -------------------------------------------------------------
# Storage Account Resource
# -------------------------------------------------------------

module "storage_account" {
  source = "../storage-account"
  depends_on = [
    module.resource_group
  ]
  storage_account_name     = var.storage_account_name
  resource_group_name      = module.resource_group.name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind

  public_network_access_enabled = var.public_network_access_enabled
  min_tls_version               = var.min_tls_version
  is_hns_enabled                = var.is_hns_enabled
  sftp_enabled                  = var.sftp_enabled

  custom_domain        = var.custom_domain
  customer_managed_key = var.customer_managed_key
  network_rules        = var.network_rules
  blob_properties      = var.blob_properties
}

/* module "blob_storage_container" {
  source = "../storage-container"
  depends_on = [
    module.resource_group,
    module.storage_account
  ]
  blob_storage_container_name = var.blob_storage_container_name
  storage_account_name        = var.storage_account_name
  resource_group_name         = module.resource_group.name
  container_access_type       = var.container_access_type
}
 */

data "azurerm_client_config" "current" {}

resource "azurerm_role_assignment" "storageAccountRoleAssignment" {
  scope                = module.resource_group.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = data.azurerm_client_config.current.object_id
}

module "data_file" {

  source = "../data-lake"

  depends_on = [
    module.storage_account , azurerm_role_assignment.storageAccountRoleAssignment
  ]

  name               = var.filesystem_name
  storage_account_id = module.storage_account.id
  properties = var.properties
  ace = var.ace
  /* owner = var.owner
  group = var.group */
  path = var.path

} 

