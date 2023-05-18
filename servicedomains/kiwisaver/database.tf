resource "astra_database" "kiwisaver" {
  name           = "kiwisaver"
  keyspace       = "kiwisaver"
  cloud_provider = var.environment == "dev" ? "azure" : "gcp"
  regions        = var.environment == "dev" ? ["australiaeast", "westeurope"] : ["us-east1"]
}