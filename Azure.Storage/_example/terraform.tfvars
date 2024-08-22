# -------------------------------------------------------------
# Resource Group variables
# -------------------------------------------------------------
name     = "rg-test-01-storage"
location = "australiaeast"
tags = {
  environment = "nonprod",
  project     = "test"
}

# -------------------------------------------------------------
# Storage Account variables
# -------------------------------------------------------------
storage_account_name          = "teststorage"
account_tier                  = "Standard"
account_kind                  = "StorageV2"
account_replication_type      = "LRS"
public_network_access_enabled = false

sftp_enabled   = true
is_hns_enabled = true

# network_rules = [
#   {
#     default_action = "Allow"
#     bypass         = ["AzureServices"]
#     ip_rules       = ["0.0.0.0/0"]
#     private_link_access = [
#       /* {
#       endpoint_resource_id = ""
#     } */
#     ]
#   }
# ]

/* static_website = {
  index_document     = "index.html"
  error_404_document = "error.html"
} */

/* blob_properties = {
  obj1 = {
    cors_rule = [{
      allowed_headers    = ["*"]
      allowed_methods    = ["GET", "HEAD"]
      allowed_origins    = ["*"]
      exposed_headers    = ["*"]
      max_age_in_seconds = 60 * 60 * 24 * 2
    }]
  }

} */
blob_properties = {}
# -------------------------------------------------------------
# Storage Container variables
# -------------------------------------------------------------

blob_storage_container_name = "testcontainer-01"
container_access_type       = "private"


# -------------------------------------------------------------
# Data file system variables
# -------------------------------------------------------------
filesystem_name = "testfilesystem"

ace = [
  {
    type        = "user"
    permissions = "rwx"
  }
]

owner = null
group = null


path = "testpath"