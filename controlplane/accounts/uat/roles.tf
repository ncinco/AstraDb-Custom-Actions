resource "astra_role" "api_uat_accounts" {
  role_name   = "ApiTeam UAT - Accounts"
  description = "ApiTeam UAT role for read operations to tables."
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