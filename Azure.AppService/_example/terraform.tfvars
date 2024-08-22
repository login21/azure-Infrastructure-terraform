# -------------------------------------------------------------
# Resource Group variables
# -------------------------------------------------------------
name     = "rg-test-01-appservice-test"
location = "australiaeast"
tags = {
  environment = "dev",
  project     = "test"
}

# -------------------------------------------------------------
# Service Plan variables
# -------------------------------------------------------------
service_plan_name = "asp-test-01-test"
os_type           = "Windows"
sku_name          = "D1"

# -------------------------------------------------------------
# Windows Web Apps variables
# -------------------------------------------------------------
win_webapp_name = {
  test01 = {
    name = "webapp-test-01"
  }
  test02 = {
    name = "webapp-test-02"
  }
  test03 = {
    name = "webapp-test-03"
  }
  test04 = {
    name = "webapp-test-04"
  }
  test05 = {
    name = "webapp-test-05"
  }
}
app_site_config = {
  always_on = false
}

#virtual_network_subnet_id = ""

ips_allowed = ["10.0.0.0/24"]

logs ={
    enable_logging = false
    detailed_error_messages = false
    failed_request_tracing  = false

}

## Create storage account for logs

## Get SAS URL for blob container as per this link
##https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account_blob_container_sas


application_logs = {
  level = "Information"   ## The level at which to log. Possible values include Error, Warning, Information, Verbose and Off
    retention_in_days = 1    ##The time in days after which to remove blobs
    #sas_url = ""     ##SAS url to an Azure blob container with read/write/list/delete permissions.
    file_system_level = "Information" ##Log level. Possible values include: Verbose, Information, Warning, and Error.
}

logcontainer_sas_url =""     ##SAS url to an Azure blob container with read/write/list/delete permissions.

