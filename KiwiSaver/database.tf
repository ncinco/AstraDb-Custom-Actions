resource "astra_database" "kiwisaver_terraform" {
  name           = "kiwisaver_terraform"
  keyspace       = "kiwisaver"
  cloud_provider = "azure"
  regions        = ["australiaeast", "westeurope"]
}