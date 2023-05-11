resource "astra_keyspace" "accounts" {
  name        = "accounts"
  database_id = astra_database.accounts_terraform.id
}

resource "astra_keyspace" "transactions" {
  name        = "transactions"
  database_id = astra_database.accounts_terraform.id
}
