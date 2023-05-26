resource "astra_database" "astradb" {
  name           = var.database
  keyspace       = var.database
  cloud_provider = var.environment == "dev" ? "azure" : "gcp"
  regions        = var.environment == "dev" ? ["australiaeast"] : ["us-east1"] #"westeurope"
}
