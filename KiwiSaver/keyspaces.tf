resource "astra_keyspace" "kiwisaver" {
  name        = "kiwisaver"
  database_id = astra_database.kiwisaver_terraform.id
}