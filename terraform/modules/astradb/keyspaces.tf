resource "astra_keyspace" "sandbox" {
  name        = "sandbox"
  database_id = astra_database.astradb.id
}