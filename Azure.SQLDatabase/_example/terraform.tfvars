# -------------------------------------------------------------
# Resource Group variables
# -------------------------------------------------------------
name     = "rg-test-01-appservice"
location = "australiaeast"
tags = {
  environment = "nonprod",
  project     = "test"
}

# -------------------------------------------------------------
# MS SQL Server variables
# -------------------------------------------------------------
mssql_server_name            = "mssqlsrv-test-01"
sql_version                  = "12.0"
administrator_login          = "sql_admin"
administrator_login_password = "admin@123"
connection_policy            = "Default"

# -------------------------------------------------------------
# MS SQL Database variables
# -------------------------------------------------------------
mssql_dbname = {
  01 = {
    name = "sqldb-test-01"
  }
  02 = {
    name = "sqldb-test-02"
  }
  03 = {
    name = "sqldb-test-03"
  }
  04 = {
    name = "sqldb-test-04"
  }
}
create_mode = "Default"
max_size_gb = 5
sku_name    = "GP_S_Gen5_2"

# -------------------------------------------------------------
# MS SQL Elasticpool variables
# -------------------------------------------------------------
mssql_elasticpool_name = {
  01 = {
    name = "mssqlep-test-01"
  }
  02 = {
    name = "mssqlep-test-02"
  }
  03 = {
    name = "mssqlep-test-03"
  }
}
ep_max_size_gb = 9.7656250
sku = {
  name     = "BasicPool",
  tier     = "Basic",
  capacity = 100,
  family   = "Gen4"
}
per_database_settings = {
  min_capacity = 2,
  max_capacity = 5
}
