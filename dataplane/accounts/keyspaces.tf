resource "astra_keyspace" "utilities" {
  name        = "utilities"
  database_id = astra_database.astradb.id
}

resource "astra_keyspace" "savings" {
  name        = "savings"
  database_id = astra_database.astradb.id
}

resource "astra_keyspace" "checkings" {
  name        = "checkings"
  database_id = astra_database.astradb.id
}

resource "astra_keyspace" "moneymarket" {
  name        = "moneymarket"
  database_id = astra_database.astradb.id
}

resource "astra_keyspace" "deposit" {
  name        = "deposit"
  database_id = astra_database.astradb.id
}
