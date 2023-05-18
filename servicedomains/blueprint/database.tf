resource "astra_database" "blueprint" {
  count          = "${var.environment == "dev" ? 1 : 0}"
  name           = "blueprint"
  keyspace       = "blueprint"
  cloud_provider = var.environment == "dev" ? "azure" : "gcp"
  regions        = var.environment == "dev" ? ["australiaeast", "westeurope"] : ["us-east1"]
}
