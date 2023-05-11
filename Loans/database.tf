resource "astra_database" "loans_terraform" {
  name           = "loans_terraform"
  keyspace       = "loans"
  cloud_provider = "azure"
  regions        = ["australiaeast", "westeurope"]
}