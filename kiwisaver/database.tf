resource "astra_database" "kiwisaver_prototype" {
  name           = "kiwisaver_prototype"
  keyspace       = "kiwisaver"
  cloud_provider = var.environment == "dev" ? "azure" : "gcp"
  regions        = var.environment == "dev" ? ["australiaeast", "westeurope"] : ["us-east1"]
}