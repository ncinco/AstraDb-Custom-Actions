resource "astra_role" "api_read_accounts" {
  role_name   = "API Read - Accounts"
  description = "Role for read and write operations to tables."
  effect      = "allow"
  resources = [
    "drn:astra:org:${var.organisationid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:accounts",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:accounts:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:deposit",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:deposit:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:checkings",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:checkings:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:moneymarket",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:moneymarket:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:savings",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:savings:table:*"
  ]
  policy = [
    "db-table-select",
    "db-cql",
    "db-rest"
  ]
}

resource "astra_role" "api_write_accounts" {
  role_name   = "API Write - Accounts"
  description = "Role for read and write operations to tables."
  effect      = "allow"
  resources = [
    "drn:astra:org:${var.organisationid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:accounts",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:accounts:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:deposit",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:deposit:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:checkings",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:checkings:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:moneymarket",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:moneymarket:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:savings",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:savings:table:*"
  ]
  policy = [
    "db-table-select",
    "db-table-modify",
    "db-cql",
    "db-rest"
  ]
}

resource "astra_role" "apiteam_accounts" {
  role_name   = "ApiTeam - Accounts"
  description = "ApiTeam role for read operations to tables."
  effect      = "allow"
  resources = [
    "drn:astra:org:${var.organisationid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:system_schema:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:system:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:system_virtual_schema:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:accounts",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:accounts:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:deposit",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:deposit:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:checkings",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:checkings:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:moneymarket",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:moneymarket:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:savings",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:savings:table:*"
  ]
  policy = [
    "db-table-select",
    "db-cql",
    "db-rest"
  ]
}
