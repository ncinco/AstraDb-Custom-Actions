resource "astra_keyspace" "accounts_second" {
  name        = "accounts_second"
  database_id = astra_database.accounts.id
}