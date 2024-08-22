data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

data "azurerm_log_analytics_workspace" "laws" {
  name                = var.laws_name
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

resource "azurerm_monitor_data_collection_rule" "data_collection_rule" {
  name                = var.name
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  # dynamic "destinations" {
  #   for_each = var.destinations
  #   content {

  #       dynamic "log_analytics" {
  #         # for_each = lookup(destinations.value, "log_analytics", [])
  #         for_each = destinations.value["log_analytics"]
  #         content {
  #           workspace_resource_id = data.azurerm_log_analytics_workspace.laws.id
  #           name                  = log_analytics.value["name"]
  #         }
  #       }
  #   }
  # }


  # destinations {
  #   log_analytics {
  #     workspace_resource_id = data.azurerm_log_analytics_workspace.laws.id
  #     name                  = var.la_destinations_name
  #   }
  # }



  # dynamic "data_sources" {
  #   for_each = var.data_sources
  #   content {
  #     dynamic "windows_event_log" {
  #       for_each = lookup(data_sources.value, "windows_event_log", [])
  #       content {
  #         streams        = lookup(windows_event_log.value, "streams", null)
  #         x_path_queries = lookup(windows_event_log.value, "x_path_queries", null)
  #         name           = lookup(windows_event_log.value, "name", null)
  #       }
  #     }
  #   }
  # }
  # dynamic "data_sources" {
  #   for_each = var.data_sources
  #   content {
  #     log_analytics {
  #       streams        = data_sources.value.streams
  #       x_path_queries = data_sources.value.x_path_queries
  #       name           = data_sources.value.name
  #     }
  #   }
  # }
  destinations {
    log_analytics {
      workspace_resource_id = data.azurerm_log_analytics_workspace.laws.id
      name                  = var.la_destination_name
    }
  }

  data_flow {
    streams      = var.data_flow.streams
    destinations = var.data_flow.destinations
  }

  data_sources {
    windows_event_log {
      streams        = var.streams
      x_path_queries = var.x_path_queries
      name           = var.windows_event_log_data_source_name
    }
  }
}