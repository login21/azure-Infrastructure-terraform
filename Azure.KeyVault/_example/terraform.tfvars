# -------------------------------------------------------------
# Resource Group variables
# -------------------------------------------------------------
name     = "rg-test-01-kv"
location = "australiaeast"
tags = {
  environment = "nonprod",
  project     = "test"
}

# -------------------------------------------------------------
# Key Vault variables
# -------------------------------------------------------------
key_vault_name = "testkv"
sku_name       = "standard"


# -------------------------------------------------------------
# Key Vault Service Principal Access Policy variables
# -------------------------------------------------------------
key_permissions = [
  "Get", "List", "Encrypt", "Decrypt"
]

secret_permissions = [
  "Get", "List", "Encrypt", "Decrypt"
]

service_principal_name = "kv-test-service-principal"