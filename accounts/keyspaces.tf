resource "astra_keyspace" "sandbox" {
  name        = "sandbox"
  database_id = astra_database.accounts.id
}
