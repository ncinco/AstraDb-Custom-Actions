resource "astra_database" "kiwisaver_prototype" {
  name           = "kiwisaver_prototype"
  keyspace       = "kiwisaver"
  cloud_provider = "azure"
  regions        = ["australiaeast", "westeurope"]
}