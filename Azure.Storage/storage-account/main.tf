## Resource group reference ##
data "azurerm_resource_group" "storage_rg" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.storage_rg.name
  location                 = data.azurerm_resource_group.storage_rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind

  public_network_access_enabled = var.public_network_access_enabled
  min_tls_version               = var.min_tls_version
  sftp_enabled                  = var.sftp_enabled
  is_hns_enabled                = var.is_hns_enabled

  enable_https_traffic_only = var.enable_https_traffic_only

  dynamic "custom_domain" {
    for_each = var.custom_domain == null ? [] : [1]

    content {
      name          = custom_domain.value.name
      use_subdomain = custom_domain.value.use_subdomain
    }
  }

  dynamic "customer_managed_key" {
    for_each = var.customer_managed_key == null ? [] : [1]

    content {
      key_vault_key_id          = customer_managed_key.value.key_vault_key_id
      user_assigned_identity_id = customer_managed_key.value.user_assigned_identity_id
    }
  }


  dynamic "network_rules" {
    for_each = var.network_rules 

    content {
      default_action             = lookup(network_rules.value, "default_action", "Allow")
      bypass                     = lookup(network_rules.value, "bypass", [])
      ip_rules                   = lookup(network_rules.value, "ip_rules", [])
      virtual_network_subnet_ids = lookup(network_rules.value, "virtual_network_subnet_ids", [])

      dynamic "private_link_access" {
        for_each = network_rules.value.private_link_access

        content {
          endpoint_resource_id = lookup(private_link_access.value.endpoint_resource_id , null)
          endpoint_tenant_id   = lookup(private_link_access.value, "endpoint_tenant_id", null)
        }
      }
    }
  }

  dynamic "blob_properties" {

    for_each = var.blob_properties 

    content {
      versioning_enabled = lookup(blob_properties.value, "versioning_enabled", false)

      dynamic "cors_rule" {

        for_each = blob_properties.value.cors_rule

        content {
          allowed_headers    = cors_rule.value.allowed_headers
          allowed_methods    = cors_rule.value.allowed_methods
          allowed_origins    = cors_rule.value.allowed_origins
          exposed_headers    = cors_rule.value.exposed_headers
          max_age_in_seconds = cors_rule.value.max_age_in_seconds
        }
      }
    }
  }

}