resource "astra_table" "bank_accounts_by_cif_with_relationship_map" {
  table              = "bank_accounts_by_cif_with_relationship_map"
  keyspace           = "accounts"
  database_id        = astra_database.accounts_terraform.id
  region             = "australiaeast"
  partition_keys     = "account_number:account_type"
  clustering_columns = "account_type"
  column_definitions= [
    {
      Name: "account_number"
      TypeDefinition: "text"
    },
    {
      Name: "account_type"
      TypeDefinition: "text"
    },
    {
      Name: "account_balance"
      TypeDefinition: "decimal"
    },
    {
      Name: "account_branch"
      TypeDefinition: "text"
    },
    {
      Name: "account_closure_datetime"
      TypeDefinition: "timestamp"
    },
    {
      Name: "account_hold_flag"
      TypeDefinition: "boolean"
    },
    {
      Name: "account_name"
      TypeDefinition: "text"
    },
    {
      Name: "account_number_tokenised"
      TypeDefinition: "uuid"
    },
    {
      Name: "account_open_datetime"
      TypeDefinition: "timestamp"
    },
    {
      Name: "available_balance"
      TypeDefinition: "decimal"
    },
    {
      Name: "currency"
      TypeDefinition: "text"
    },
    {
      Name: "product_name"
      TypeDefinition: "text"
    },
    {
      Name: "product_number"
      TypeDefinition: "uuid"
    },
    {
      Name: "account_hold_flag"
      TypeDefinition: "boolean"
    }
  ]
}
