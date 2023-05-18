resource "astra_database" "blueprint" {
  name           = "blueprint"
  keyspace       = "blueprint"
  cloud_provider = var.environment == "dev" ? "azure" : "gcp"
  regions        = var.environment == "dev" ? ["australiaeast", "westeurope"] : ["us-east1"]
}