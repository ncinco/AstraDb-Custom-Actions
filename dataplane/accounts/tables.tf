resource "astra_table" "executed_scripts" {
  table                = "executed_scripts"
  keyspace             = "utilities"
  database_id          = astra_database.astradb.id
  region               = var.environment == "dev" ? "australiaeast" : "us-east1"
  clustering_columns   = "execution_id:execution_timestamp"
  partition_keys       = "folder:script_name:triggered_by"
  column_definitions   = [
    {
      Name: "folder"
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
