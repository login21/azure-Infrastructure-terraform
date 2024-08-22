
variable "name" {
  description = "The name of the Data Lake Gen2 File System which should be created within the Storage Account."
  type        = string
}

variable "storage_account_id" {
  description = "Specifies the ID of the Storage Account in which the Data Lake Gen2 File System should exist"
  type        = string
}

variable "properties" {
  description = "A mapping of Key to Base64-Encoded Values which should be assigned to this Data Lake Gen2 File System."
  type        = map(string)
  default = null
}

variable "ace" {
  description = "One or more ace blocks as defined below to specify the entries for the ACL for the path."
  type        = list(object({
    scope = optional(string)
    type  = string
    permissions = string
  }))
} 

variable "create_data_lake_path" {
  description = "Does data lake path need to create?"
  type        = bool
  default     = false
}


variable "path" {
  description = "The path which should be created within the Data Lake Gen2 File System in the Storage Account."
  type        = string
}





