resource "astra_database" "accounts_terraform" {
  name           = "accounts_terraform"
  keyspace       = "accounts"
  cloud_provider = "azure"
  regions        = ["australiaeast", "westeurope"]
}
