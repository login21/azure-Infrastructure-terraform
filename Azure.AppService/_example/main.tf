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
# App Service plan
# -------------------------------------------------------------

module "service_plan" {

  source = "../service-plan"
  depends_on = [
    module.resource_group
  ]
  name                = var.service_plan_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  os_type             = var.os_type
  sku_name            = var.sku_name
  tags                = var.tags
}


# -------------------------------------------------------------
# App Services
# -------------------------------------------------------------

module "win_web_app" {

  source = "../windows-web-app"
  depends_on = [
    module.resource_group,
    module.service_plan
  ]
  for_each = var.win_webapp_name

  name                = each.value["name"]
  location =  var.location
  resource_group_name = module.resource_group.name
  service_plan_id   = module.service_plan.id
  site_config         = var.app_site_config

  app_settings       = var.app_settings
  connection_strings = var.connection_strings
  tags               = var.tags

  #virtual_network_subnet_id = var.virtual_network_subnet_id

  ips_allowed = var.ips_allowed
  subnet_ids_allowed = var.subnet_ids_allowed
  service_tags_allowed = var.service_tags_allowed

  logs = var.logs

  application_logs = var.application_logs

  logcontainer_sas_url = var.logcontainer_sas_url

  app_insights_name = each.value["name"]

  log_analytics_workspace_id = "/subscriptions/id/resourceGroups/rg-name/providers/Microsoft.OperationalInsights/workspaces/laws-name"
}