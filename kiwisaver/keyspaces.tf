resource "astra_keyspace" "kiwisaver_second" {
  name        = "kiwisaver_second"
  database_id = astra_database.kiwisaver.id
}
