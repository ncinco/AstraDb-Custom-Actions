resource "astra_keyspace" "utilities" {
  name        = "utilities"
  database_id = astra_database.astradb.id
}