variable "resource_group_name" {
  description = "value"
  type        = string
}

variable "storage_account_name" {
  description = "Specifies the name of the Storage Account"
  type        = string
}

variable "mssql_server_name" {
  description = "The name of this Microsoft SQL Server."
  type        = string
}

variable "mssql_dbname" {
  description = "The name of the MS SQL Database."
  type        = string
}

variable "service_plan_name" {
  description = "The name which should be used for this Windows Function App. Changing this forces a new Windows Function App to be created. Limit the function name to 32 characters to avoid naming collisions."
  type        = string
}

variable "win_webapp_name" {
  description = "The name which should be used for this Windows Web App. Changing this forces a new Windows Web App to be created."
  type        = string
}

variable "name" {
  description = "The name of the service connection. Changing this forces a new resource to be created."
  type        = string
}

variable "app_service_id" {
  description = "The ID of the data source web app. Changing this forces a new resource to be created."
  type        = string
}

variable "target_resource_id" {
  description = "The ID of the target resource. Changing this forces a new resource to be created. Possible values are Postgres, PostgresFlexible, Mysql, Sql, Redis, RedisEnterprise, CosmosCassandra, CosmosGremlin, CosmosMongo, CosmosSql, CosmosTable, StorageBlob, StorageQueue, StorageFile, StorageTable, AppConfig, EventHub, ServiceBus, SignalR, WebPubSub, ConfluentKafka."
  type        = string
}

variable "auth_type" {
  description = "The authentication type. Possible values are systemAssignedIdentity, userAssignedIdentity, servicePrincipalSecret, servicePrincipalCertificate, secret. Changing this forces a new resource to be created."
  type        = string
}

variable "client_id" {
  description = " Client ID for userAssignedIdentity or servicePrincipal auth. Should be specified when type is set to servicePrincipalSecret or servicePrincipalCertificate. When type is set to userAssignedIdentity, client_id and subscription_id should be either both specified or both not specified."
  type        = string
}

variable "vnet_solution" {
  description = "The type of the VNet solution. Possible values are serviceEndpoint, privateLink."
  type        = string
}

