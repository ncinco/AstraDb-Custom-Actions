resource "astra_keyspace" "loans_second" {
  name        = "loans_second"
  database_id = astra_database.loans_prototype.id
}