resource "astra_database" "accounts_dev" {
  name           = "accounts_dev"
  keyspace       = "accounts"
  cloud_provider = "azure"
  regions        = ["australiaeast", "westeurope"]
}

resource "astra_database" "transactions_dev" {
  name           = "transactions_dev"
  keyspace       = "accounts"
  cloud_provider = "azure"
  regions        = ["australiaeast", "westeurope"]
}
