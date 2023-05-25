resource "astra_table" "executed_scripts" {
  table               = "executed_scripts"
  keyspace            = "utilities"
  database_id         = astra_database.astradb.id
  region              = "australiaeast"
  partition_keys      = "execution_id:script_name"
  clustering_columns  = "execution_datetime"
  column_definitions= [
    {
      Name: "execution_id"
      TypeDefinition: "uuid"
    },
    {
      Name: "execution_datetime"
      TypeDefinition: "timestamp"
    },
    {
      Name: "script_name"
      TypeDefinition: "text"
    },
    {
      Name: "triggered_by"
      TypeDefinition: "text"
    },
  ]
}
