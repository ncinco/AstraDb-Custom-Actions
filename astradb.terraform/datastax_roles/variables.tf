variable "token" {
  type        = string
  description = "Access token for AstraDB control plane activities"
}

variable "datastax_org_id" {
  type        = string
  description = "AstraDB Organisation ID, which is equivalent to ASB Environment e.g. DEV, UAT, PROD"
}

variable "api_read_policy" {
  type        = list(string)
  description = "List of string of api_read_policy"
  default = [
    "db-rest",
    "db-table-describe",
    "db-table-select"
  ]
}

variable "api_write_policy" {
  type        = list(string)
  description = "List of string of api_write_policy"
  default = [
    "accesslist-read",
    "db-all-keyspace-describe",
    "db-graphql",
    "db-keyspace-describe",
    "db-rest",
    "db-table-describe",
    "db-table-modify",
    "db-table-select",
    "org-db-view",
    "org-user-read"
  ]
}
