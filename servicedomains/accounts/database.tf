resource "astra_database" "accounts" {
  name           = "accounts"
  keyspace       = "accounts"
  cloud_provider = var.environment == "dev" ? "azure" : "gcp"
  regions        = var.environment == "dev" ? ["australiaeast", "westeurope"] : ["us-east1"]
}