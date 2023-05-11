resource "astra_database" "accounts_prototype" {
  name           = "accounts_prototype"
  keyspace       = "accounts"
  cloud_provider = "azure"
  regions        = ["australiaeast", "westeurope"]
}