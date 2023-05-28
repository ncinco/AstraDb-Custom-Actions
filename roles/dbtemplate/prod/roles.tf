resource "astra_role" "api_prod_[dbtemplate]" {
  role_name   = "ApiTeam Prod - [dbtemplate]"
  description = "ApiTeam Prod role for read operations to tables."
  effect      = "allow"
  resources = [
    "drn:astra:org:${var.organisationid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:[dbtemplate]",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:[dbtemplate]:table:*"
  ]
  policy = [
    "db-table-select",
    "db-cql",
    "db-rest"
  ]
}