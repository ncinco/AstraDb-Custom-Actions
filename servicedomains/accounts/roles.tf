resource "astra_role" "api_read_account" {
  role_name   = "api_read_account"
  description = "Role for read and write operations to tables."
  effect      = "allow"
  resources = [
    # The following 3 resources are needed and wildcarded to associate the role to all dbs
    "drn:astra:org:f9f4b1e0-4c05-451e-9bba-d631295a7f73:db:{astra_database.astradb.id}",
    "drn:astra:org:f9f4b1e0-4c05-451e-9bba-d631295a7f73:db:{astra_database.astradb.id}:keyspace:*",
    "drn:astra:org:f9f4b1e0-4c05-451e-9bba-d631295a7f73:db:{astra_database.astradb.id}:keyspace:*:table:*"
  ]
  policy = [
    "db-table-select",
    "db-cql",
    "db-rest"
  ]
}
