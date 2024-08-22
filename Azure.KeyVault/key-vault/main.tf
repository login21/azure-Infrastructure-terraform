## Access the configuration of the AzureRM provider ##
data "azurerm_client_config" "current" {}


## Creating the Azure Key Vault Resource ## 
resource "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.sku_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  
  enabled_for_deployment = var.enabled_for_deployment
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment 
  enable_rbac_authorization = var.enable_rbac_authorization
  purge_protection_enabled  = var.purge_protection_enabled 
  public_network_access_enabled = var.public_network_access_enabled
  soft_delete_retention_days = var.soft_delete_retention_days 

  tags = var.tags

}