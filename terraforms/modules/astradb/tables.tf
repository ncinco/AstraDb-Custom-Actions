resource "astra_table" "executed_scripts" {
  table               = "executed_scripts"
  keyspace            = "utilities"
  database_id         = astra_database.astradb.id
  region              = "australiaeast"
  partition_keys      = "folder:script_name:triggered_by"
  clustering_columns  = "execution_timestamp"
  column_definitions= [
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
}
