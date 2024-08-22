
resource "azurerm_windows_web_app" "win_web_app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  dynamic "site_config" {
    for_each = [merge(local.default_site_config, var.site_config)]

    content {
      always_on                = lookup(site_config.value, "always_on", false)
      app_command_line         = lookup(site_config.value, "app_command_line", null)
      default_documents        = lookup(site_config.value, "default_documents", null)
      ftps_state               = lookup(site_config.value, "ftps_state", "FtpsOnly")
      health_check_path        = lookup(site_config.value, "health_check_path", null)
      http2_enabled            = lookup(site_config.value, "http2_enabled", false)
      windows_fx_version       = lookup(site_config.value, "windows_fx_version", null)
      managed_pipeline_mode    = lookup(site_config.value, "managed_pipeline_mode", "Integrated")
      minimum_tls_version      = lookup(site_config.value, "minimum_tls_version", "1.2")
      remote_debugging_enabled = lookup(site_config.value, "remote_debugging_enabled", null)
      remote_debugging_version = lookup(site_config.value, "remote_debugging_version", null)
      scm_type                 = lookup(site_config.value, "scm_type", null)
      websockets_enabled       = lookup(site_config.value, "websockets_enabled", null)
      ip_restriction           = concat(local.subnets, local.ip_address, local.service_tags)


      dynamic "cors" {
        for_each = lookup(site_config.value, "cors", [])
        content {
          allowed_origins     = cors.value.allowed_origins
          support_credentials = lookup(cors.value, "support_credentials", null)
        }
      }
    }
  }

  app_settings = merge(local.default_app_settings, var.app_settings)

  dynamic "connection_string" {
    for_each = var.connection_strings
    content {
      name  = lookup(connection_string.value, "name", null)
      type  = lookup(connection_string.value, "type", null)
      value = lookup(connection_string.value, "value", null)
    }
  }

  https_only                = var.https_only
  virtual_network_subnet_id = var.virtual_network_subnet_id

  identity {
    type         = var.identity_ids != null ? "SystemAssigned, UserAssigned" : "SystemAssigned"
    identity_ids = var.identity_ids
  }


  dynamic "logs" {
    for_each = var.logs.enable_logging ? [{}] : []

    content {
      application_logs {
        azure_blob_storage  {
          level = var.application_logs.level
          retention_in_days  = var.application_logs.retention_in_days
          sas_url = var.logcontainer_sas_url
        }
        file_system_level  =  var.application_logs.file_system_level
      }
      detailed_error_messages  = var.logs.detailed_error_messages
      failed_request_tracing = var.logs.failed_request_tracing

    }

  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

}


#---------------------------------------------------------
# Application Insights resoruces - Default is "false"
#----------------------------------------------------------

resource "azurerm_application_insights" "main" {
  count               = var.application_insights_enabled ? 1 : 0

  name                = lower(format("appinsight-%s", var.app_insights_name))
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = var.application_insights_type
  retention_in_days   = var.retention_in_days
  disable_ip_masking  = var.disable_ip_masking
  workspace_id        = var.log_analytics_workspace_id
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      tags,
      location
    ]
  }
}