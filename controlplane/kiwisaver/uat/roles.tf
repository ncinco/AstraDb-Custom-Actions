resource "astra_role" "api_read_kiwisaver" {
  role_name   = "API Read - Kiwisaver"
  description = "Role for read and write operations to tables."
  effect      = "allow"
  resources = [
    "drn:astra:org:${var.organisationid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:kiwisaver",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:kiwisaver:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:conservative",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:conservative:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:moderate",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:moderate:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:balanced",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:balanced:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:growth",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:growth:table:*"
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
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:kiwisaver",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:kiwisaver:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:conservative",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:conservative:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:moderate",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:moderate:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:balanced",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:balanced:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:growth",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:growth:table:*"
  ]
  policy = [
    "db-table-select",
    "db-table-modify",
    "db-cql",
    "db-rest"
  ]
}

resource "astra_role" "api_kiwisaver" {
  role_name   = "ApiTeam - Kiwisaver"
  description = "AppTeam role for read and write operations to tables."
  effect      = "allow"
  resources = [
    "drn:astra:org:${var.organisationid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:kiwisaver",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:kiwisaver:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:conservative",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:conservative:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:moderate",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:moderate:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:balanced",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:balanced:table:*",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:growth",
    "drn:astra:org:${var.organisationid}:db:${var.astradbid}:keyspace:growth:table:*"
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
