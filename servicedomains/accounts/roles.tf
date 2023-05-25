resource "astra_role" "api_read_account" {
  role_name   = "API Read [Account]"
  description = "Role for read and write operations to tables."
  effect      = "allow"
  resources = [
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

resource "astra_role" "api_write_account" {
  role_name   = "API Write [Account]"
  description = "Role for read and write operations to tables.",
  effect      = "allow"
  resources = [
    "drn:astra:org:${var.organisationid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:*:table:*"
  ]
  policy = [
    "db-table-select",
    "db-table-modify",
    "db-cql",
    "db-rest"
  ]
}

resource "astra_role" "api_dev_account" {
  role_name   = "ApiTeam Dev [Account]"
  description = "AppTeam Dev role for read and write operations to tables.",
  effect      = "allow"
  resources = [
    "drn:astra:org:${var.organisationid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:*:table:*"
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

resource "astra_role" "api_uat_account" {
  role_name   = "ApiTeam UAT [Account]"
  description = "ApiTeam UAT role for read operations to tables.",
  effect      = "allow"
  resources = [
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

resource "astra_role" "api_prod_account" {
  role_name   = "ApiTeam Prod [Account]"
  description = "ApiTeam Prod role for read operations to tables.",
  effect      = "allow"
  resources = [
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
