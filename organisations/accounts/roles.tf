resource "astra_role" "api_read_accounts" {
  role_name   = "API Read [Accounts]"
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

resource "astra_role" "api_write_accounts" {
  role_name   = "API Write [Accounts]"
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
    "db-table-modify",
    "db-cql",
    "db-rest"
  ]
}

resource "astra_role" "api_dev_accounts" {
  role_name   = "ApiTeam Dev [Accounts]"
  description = "AppTeam Dev role for read and write operations to tables."
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

resource "astra_role" "api_uat_accounts" {
  role_name   = "ApiTeam UAT [Accounts]"
  description = "ApiTeam UAT role for read operations to tables."
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

resource "astra_role" "api_prod_accounts" {
  role_name   = "ApiTeam Prod [Accounts]"
  description = "ApiTeam Prod role for read operations to tables."
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