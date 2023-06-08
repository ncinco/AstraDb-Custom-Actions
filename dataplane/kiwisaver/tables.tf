resource "astra_table" "executed_scripts" {
  table                = "executed_scripts"
  keyspace             = var.database
  database_id          = astra_database.astradb.id
  region               = var.environment == "dev" ? "australiaeast" : "us-east1"
  clustering_columns   = "execution_id"
  partition_keys       = "domain:script_name"
  column_definitions   = [
    {
      Name: "domain"
      TypeDefinition: "text"
    },
    {
      Name: "script_name"
      TypeDefinition: "text"
    },
    {
      Name: "triggered_by"
      TypeDefinition: "text"
    },
    {
      Name: "execution_id"
      TypeDefinition: "uuid"
    },
    {
      Name: "execution_timestamp"
      TypeDefinition: "timestamp"
    }
  ]
}
