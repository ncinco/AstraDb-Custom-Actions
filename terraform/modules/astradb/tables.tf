resource "astra_table" "executed_scripts" {
  table               = "executed_scripts"
  keyspace            = var.database
  database_id         = astra_database.astradb.id
  region              = "australiaeast"
  partition_keys      = "execution_id:script_name"
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
