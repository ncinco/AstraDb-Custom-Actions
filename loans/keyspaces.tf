resource "astra_keyspace" "accounts" {
  name        = "loans"
  database_id = astra_database.accounts_terraform.id
}