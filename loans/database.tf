resource "astra_database" "loans_prototype" {
  name           = "loans_prototype"
  keyspace       = "loans"
  cloud_provider = var.environment == "dev" ? "azure" : "gcp"
  regions        = var.environment == "dev" ? ["australiaeast", "westeurope"] : ["us-east1"]
}