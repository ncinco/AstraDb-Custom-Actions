resource "astra_role" "api_read_account" {
  role_name   = "api_read_account"
  description = "Role for read and write operations to tables."
  effect      = "allow"
  resources = [
    # The following 3 resources are needed and wildcarded to associate the role to all dbs
    "drn:astra:org:9ffa81f4-288b-49b0-b580-4c45e9155592:db:{astra_database.astradb.id}",
    "drn:astra:org:9ffa81f4-288b-49b0-b580-4c45e9155592:db:{astra_database.astradb.id}:keyspace:*",
    "drn:astra:org:9ffa81f4-288b-49b0-b580-4c45e9155592:db:{astra_database.astradb.id}:keyspace:*:table:*"
  ]
  policy = [
    "db-table-select",
    "db-cql",
    "db-rest"
  ]
}
