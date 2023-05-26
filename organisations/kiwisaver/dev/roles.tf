resource "astra_role" "api_read_kiwisaver" {
  role_name   = "API Read - Kiwisaver"
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

resource "astra_role" "api_write_kiwisaver" {
  role_name   = "API Write - Kiwisaver"
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

resource "astra_role" "api_dev_kiwisaver" {
  role_name   = "ApiTeam Dev - Kiwisaver"
  description = "AppTeam Dev role for read and write operations to tables."
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
    "db-table-describe",

    "db-keyspace-describe",

    "db-cql",
    "db-rest",

    "org-db-view"
  ]
}
