resource "astra_database" "accounts_terraform" {
  name           = "accounts_terraform"
  keyspace       = "accounts"
  cloud_provider = "azure"
  regions        = ["australiaeast", "westeurope"]
}

resource "astra_database" "transactions_terraform" {
  name           = "transactions_terraform"
  keyspace       = "transactions"
  cloud_provider = "azure"
  regions        = ["australiaeast", "westeurope"]
}
