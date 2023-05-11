resource "astra_database" "loans_prototype" {
  name           = "loans_prototype"
  keyspace       = "loans"
  cloud_provider = "azure"
  regions        = ["australiaeast", "westeurope"]
}