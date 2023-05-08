resource "astra_database" "accounts_dev_tf" {
  name           = "accounts_dev_tf"
  keyspace       = "accounts"
  cloud_provider = "azure"
  regions        = ["australiaeast", "westeurope"]
}

resource "astra_database" "transactions_dev_tf" {
  name           = "transactions_dev_tf"
  keyspace       = "transactions"
  cloud_provider = "azure"
  regions        = ["australiaeast", "westeurope"]
}
