resource "astra_database" "loans" {
  name           = "loans"
  keyspace       = "loans"
  cloud_provider = var.environment == "dev" ? "azure" : "gcp"
  regions        = var.environment == "dev" ? ["australiaeast", "westeurope"] : ["us-east1"]
}