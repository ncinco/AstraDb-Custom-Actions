resource "astra_keyspace" "conservative" {
  name        = "conservative"
  database_id = astra_database.astradb.id
}

resource "astra_keyspace" "moderate" {
  name        = "moderate"
  database_id = astra_database.astradb.id
}

resource "astra_keyspace" "balanced" {
  name        = "balanced"
  database_id = astra_database.astradb.id
}

resource "astra_keyspace" "growth" {
  name        = "growth"
  database_id = astra_database.astradb.id
}
