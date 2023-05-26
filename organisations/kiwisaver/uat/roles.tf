resource "astra_role" "api_uat_kiwisaver" {
  role_name   = "ApiTeam UAT - Kiwisaver"
  description = "ApiTeam UAT role for read operations to tables."
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
