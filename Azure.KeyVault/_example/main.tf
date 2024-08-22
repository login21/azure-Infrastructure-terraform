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
# Non Production Key Vault Resources
# -------------------------------------------------------------

module "key_vault" {
  source = "../key-vault"
  depends_on = [
    module.resource_group
  ]
  key_vault_name      = var.key_vault_name
  resource_group_name = module.resource_group.name
  sku_name            = var.sku_name
  location = var.location
  tags = var.tags
}

# -------------------------------------------------------------
# Non Production Key Vault Access Policy Resources
# -------------------------------------------------------------

module "key_vault_access_policy" {
  source = "../key-vault-access-policy"
  depends_on = [
    module.key_vault,
    module.resource_group
  ]
  resource_group_name    = module.resource_group.name
  key_vault_name         = var.key_vault_name
  key_permissions        = var.key_permissions
  secret_permissions     = var.secret_permissions
  service_principal_name = var.service_principal_name
}