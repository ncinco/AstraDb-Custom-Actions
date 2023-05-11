resource "astra_keyspace" "accounts" {
  name        = "accounts"
  database_id = astra_database.accounts_terraform.id
}