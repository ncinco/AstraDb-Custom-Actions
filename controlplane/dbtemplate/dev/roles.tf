resource "astra_role" "api_read_[dbtemplate]" {
  role_name   = "API Read - [dbtemplate]"
  description = "Role for read and write operations to tables."
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

resource "astra_role" "api_write_[dbtemplate]" {
  role_name   = "API Write - [dbtemplate]"
  description = "Role for read and write operations to tables."
  effect      = "allow"
  resources = [
    "drn:astra:org:${var.organisationid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:[dbtemplate]",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:[dbtemplate]:table:*"
  ]
  policy = [
    "db-table-select",
    "db-table-modify",
    "db-cql",
    "db-rest"
  ]
}

resource "astra_role" "api_[dbtemplate]" {
  role_name   = "ApiTeam - [dbtemplate]"
  description = "AppTeam role for read and write operations to tables."
  effect      = "allow"
  resources = [
    "drn:astra:org:${var.organisationid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:[dbtemplate]",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:[dbtemplate]:table:*"
  ]
  policy = [
    "db-table-select",
    "db-table-modify",
    "db-table-describe",

    "db-keyspace-describe",

    "db-cql",
    "db-rest",

    "org-db-view"
  ]
}
