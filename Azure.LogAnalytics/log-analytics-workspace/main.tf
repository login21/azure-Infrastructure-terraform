data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = var.name
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
  tags                = var.tags
}

# resource "azurerm_monitor_action_group" "commons_ag" {
#   name                = "deloitte-action-group"
#   resource_group_name = azurerm_resource_group.commons_rg.name
#   short_name          = "deloitteL3"
#   tags                = local.tags

#   webhook_receiver {
#     name        = "Opsgenie/Pagerduty Webhook"
#     service_uri = "Opsgenie/Pagerduty"
#     use_common_alert_schema = true
#   }
# }

# resource "azurerm_log_analytics_workspace" "commons_workspace" {
#   name                = "log-analytics"
#   location            = azurerm_resource_group.commons_rg.location
#   resource_group_name = azurerm_resource_group.commons_rg.name
#   sku                 = "PerGB2018"
#   daily_quota_gb      = -1
#   retention_in_days   = 30
#   tags                = {
#     "environment"     = "${var.prefix}"
#   }
# }

#Dont need
# resource "azurerm_log_analytics_solution" "analytics_insights" {
#   solution_name         = "VMInsights"
#   location              = azurerm_resource_group.commons_rg.location
#   resource_group_name   = azurerm_resource_group.commons_rg.name
#   workspace_resource_id = azurerm_log_analytics_workspace.commons_workspace.id
#   workspace_name        = azurerm_log_analytics_workspace.commons_workspace.name

#   plan {
#     publisher = "Microsoft"
#     product   = "OMSGallery/VMInsights"
#   }
# }

# resource "azurerm_virtual_machine_extension" "dependency_agent" {
#   count                      = var.Virtual_count
#   name                       = "DAExtension"
#   virtual_machine_id         =  azurerm_linux_virtual_machine.virtual_vms[count.index].id
#   publisher                  = "Microsoft.Azure.Monitoring.DependencyAgent"
#   type                       = "DependencyAgentLinux"
#   type_handler_version       = "9.5"
#   auto_upgrade_minor_version = true

# }

#Ensure VM has a managed identity or system assigned identity
# resource "azurerm_virtual_machine_extension" "monitor_agent" {
#   count                 = var.Virtual_count
#   automatic_upgrade_enabled  = true
#   name                  = "AzureMonitorLinuxAgent" 
#   virtual_machine_id    = azurerm_linux_virtual_machine.virtual_vms[count.index].id
#   publisher             = "Microsoft.Azure.Monitor"
#   type                  = "AzureMonitorLinuxAgent"
#   type_handler_version  = "1.22"
#   auto_upgrade_minor_version = true
# }

# azapi resource provider is used here because this current version of terraform does 
# not recognise new azurerm data collection rule and association resource blocks
# resource "azapi_resource" "data_collection_rule" {
#   type                        = "Microsoft.Insights/dataCollectionRules@2021-09-01-preview"
#   name                        = "msvmi-${var.prefix}-vm-data-collection"
#   location                    = azurerm_resource_group.commons_rg.location
#   parent_id                   = azurerm_resource_group.commons_rg.id
#   body                        = jsonencode({
#     properties                = {
#       dataSources             = {
#         performanceCounters          = [{
#           counterSpecifiers          = ["\\VmInsights\\DetailedMetrics"]
#           name                       = "perfCounterDataSource60"        
#           streams                    = ["Microsoft-InsightsMetrics"]
#           samplingFrequencyInSeconds = 60 ##################to discuss with DPC
#         }]
#         syslog                       = [{
#           facilityNames              = ["local0"]
#           logLevels                  = ["Info"]
#           name                       = "sysLogNodeTool"
#           streams                    = ["Microsoft-Syslog"]
#         }]
#       }
#       dataFlows               = [
#         {
#           streams               = ["Microsoft-InsightsMetrics", "Microsoft-Syslog"]
#           destinations          = [azurerm_log_analytics_workspace.commons_workspace.name]
#         }
#       ]
#       destinations            = {
#         logAnalytics          = [
#           {
#             workspaceResourceId = azurerm_log_analytics_workspace.commons_workspace.id
#             name                = azurerm_log_analytics_workspace.commons_workspace.name
#           }
#         ]
#       }

#     }
#   })
# }

# resource "azapi_resource" "dcr_resource_associations" {
#   count                         = var.nvirtualMachine
#   type                          = "Microsoft.Insights/dataCollectionRuleAssociations@2021-09-01-preview"
#   name                          = "VMInsights-Dcr-Association"
#   parent_id                     = azurerm_linux_virtual_machine.virtual_machine[count.index].id
#   schema_validation_enabled     = true
#   ignore_casing                 = false
#   ignore_missing_property       = false
#   body                          = jsonencode({
#     properties                  = {
#       # dataCollectionEndpointId  = "string"
#       dataCollectionRuleId      = azapi_resource.data_collection_rule.id
#       description               = "Association of data collection rule for VM Insights."
#     }
#   })
#   timeouts {}
# }

### Service monitoring

## Virtual MAchine

# resource "azurerm_monitor_scheduled_query_rules_alert" "vm_heartbeat" {
#   enabled                 = false 
#   name                    = "${var.prefix}-virtual-nodes-no-heartbeat-for-5-minutes"
#   description             = "Trigger an alert if any of the ${var.prefix} Virtual Machine Nodes do not have a heartbeat for an interval of 10 mins" 
#   location                = azurerm_resource_group.commons_rg.location
#   resource_group_name     = azurerm_resource_group.commons_rg.name
#   auto_mitigation_enabled = true
#   authorized_resource_ids = []
#   tags                    = {
#             "environment" = "${var.prefix}"
#   }
#   action {
#     action_group          = [azurerm_monitor_action_group.commons_ag.id]
#   }
#   data_source_id          = azurerm_log_analytics_workspace.commons_workspace.id
#   query                   = <<-EOT
#     Heartbeat
#     | where Computer has "node"
#     | summarize LastHeartbeat=max(TimeGenerated) by Computer
#     | where LastHeartbeat > ago(5m)
#   EOT
#   timeouts {}
#   severity                = var.sandpit_severity #2
#   frequency               = 5
#   time_window             = 10
#   trigger {
#     operator              = "LessThan"
#     threshold             = var.VirtualMachine_count
#   }
# }


# resource "azurerm_monitor_scheduled_query_rules_alert" "_disk_monitoring_lt" {
#   enabled                 = false
#   for_each                = var.disk_thresholds_severity
#   name                    = "${var.prefix}-virtual-nodes-freediskpercentage-less-than-${each.key}"
#   description             = "Trigger an alert if the free disk percentage on any logical disk on any ${var.prefix} virtual node falls below ${each.key}%" 
#   location                = azurerm_resource_group.commons_rg.location
#   resource_group_name     = azurerm_resource_group.commons_rg.name
#   auto_mitigation_enabled = true
#   tags                    = {}
#   authorized_resource_ids = []
#   timeouts {}
#   action {
#     action_group          = [azurerm_monitor_action_group.commons_ag.id]
#   }
#   data_source_id          = azurerm_log_analytics_workspace.commons_workspace.id
#   query                   = <<-EOT
#     InsightsMetrics 
#     | where Origin == "vm.azm.ms" 
#     | where Namespace == "LogicalDisk" and Name == "FreeSpacePercentage" 
#     | where Computer has "node"
#     | summarize AggregatedValue = avg(Val) by bin(TimeGenerated, 15m), Computer, _ResourceId, Tags
#   EOT

#   severity                = each.value
#   frequency               = 15
#   time_window             = 15
#   trigger {
#     operator              = "LessThanOrEqual"
#     threshold             = each.key
#     metric_trigger {
#       metric_column       = "Tags,Computer"
#       metric_trigger_type = "Consecutive" 
#       operator            = "GreaterThan"
#       threshold           = 0
#     }
#   }
# }

# resource "azurerm_monitor_scheduled_query_rules_alert" "mem_monitoring_lt" {
#   enabled                 = false 
#   for_each                = var.memory_thresholds_severity
#   name                    = "${var.prefix}-virtual-nodes-available-memory-less-than-${each.key}-percent"
#   description             = "Trigger an alert if the available memory for any ${var.prefix} virtual Node becomes less than ${each.key}%" 
#   location                = azurerm_resource_group.commons_rg.location
#   resource_group_name     = azurerm_resource_group.commons_rg.name
#   auto_mitigation_enabled = true
#   tags                    = {}
#   authorized_resource_ids = []
#   action {
#     action_group          = [azurerm_monitor_action_group.commons_ag.id]
#   }
#   timeouts {}
#   data_source_id          = azurerm_log_analytics_workspace.commons_workspace.id
#   query                   = <<-EOT
#     InsightsMetrics 
#     | where Origin == "vm.azm.ms" 
#     | where Namespace == "Memory" and Name == "AvailableMB" 
#     | where Computer has "node"
#     | extend TotalMemory = toreal(todynamic(Tags)["vm.azm.ms/memorySizeMB"])
#     | extend AvailableMemoryPercentage = (toreal(Val) / TotalMemory) * 100.0 
#     | summarize AggregatedValue = avg(AvailableMemoryPercentage) by bin(TimeGenerated, 15m), Computer, _ResourceId 
#   EOT

#   severity                = each.value #3 
#   frequency               = 15
#   time_window             = 15
#   trigger {
#     operator              = "LessThanOrEqual"
#     threshold             = each.key
#     metric_trigger {
#       metric_column       = "Computer"
#       metric_trigger_type = "Total" 
#       operator            = "GreaterThan"
#       threshold           = 0
#     }
#   }
# }

# resource "azurerm_monitor_scheduled_query_rules_alert" "cpu_monitoring_gt" {
#   enabled                 = false
#   for_each                = var.cpu_thresholds_severity
#   name                    = "${var.prefix}-virtual-nodes-cpu-utilization-greater-than-${each.key}-percent"
#   description             = "Trigger an alert when the CPU utilization of any ${var.prefix} virtual nodes is greater than ${each.key}%" 
#   location                = azurerm_resource_group.commons_rg.location
#   resource_group_name     = azurerm_resource_group.commons_rg.name
#   tags                    = {}
#   authorized_resource_ids = []
#   action {
#     action_group          = [azurerm_monitor_action_group.commons_ag.id]
#   }
#   data_source_id          = azurerm_log_analytics_workspace.commons_workspace.id
#   query                   = <<-EOT
#     InsightsMetrics
#     | where Origin == "vm.azm.ms" 
#     | where Namespace == "Processor" and Name == "UtilizationPercentage" 
#     | where Computer has "node"
#     | summarize AggregatedValue = avg(Val) by bin(TimeGenerated, 15m), Computer, _ResourceId
#   EOT

#   severity                = each.value #3
#   frequency               = 15
#   time_window             = 15
#   trigger {
#     operator              = "GreaterThan"
#     threshold             = each.key
#     metric_trigger {
#       metric_column       = "Computer"
#       metric_trigger_type = "Total" 
#       operator            = "GreaterThan"
#       threshold           = 0
#     }
#   }
# }
