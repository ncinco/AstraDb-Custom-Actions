resource "astra_role" "api_read_account" {
  role_name   = "API Read {var.database}"
  description = "Role for read and write operations to tables."
  effect      = "allow"
  resources = [
    # The following 3 resources are needed and wildcarded to associate the role to all dbs
    "drn:astra:org:${var.organisationid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:*:table:*"
  ]
  policy = [
    "db-table-select",
    "db-cql",
    "db-rest"
  ]
}
