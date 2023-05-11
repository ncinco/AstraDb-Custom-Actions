resource "astra_database" "accounts_prototype" {
  name           = "accounts_prototype"
  keyspace       = "accounts"
  cloud_provider = var.environment == "dev" ? "azure" : "gcp"
  regions        = var.environment == "dev" ? ["australiaeast", "westeurope"] : ["us-east1"]
}