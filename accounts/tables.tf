resource "astra_table" "bank_accounts_by_cif_with_relationship_map" {
  table              = "bank_accounts_by_cif_with_relationship_map"
  keyspace           = "accounts"
  database_id        = astra_database.accounts_prototype.id
  region             = "australiaeast"
  partition_keys     = "account_number:account_type"
  clustering_columns = "account_type"
  column_definitions = [
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

resource "astra_table" "transactions_by_account" {
  table              = "transactions_by_account"
  keyspace           = "accounts"
  database_id        = astra_database.accounts_prototype.id
  region             = "australiaeast"
  partition_keys     = "account_number:transaction_id"
  clustering_columns = "account_type"
  column_definitions = [
    {
      Name: "account_number"
      TypeDefinition: "text"
    },
    {
      Name: "transaction_id"
      TypeDefinition: "text"
    },
    {
      Name: "transaction_date"
      TypeDefinition: "timestamp"
    },
    {
      Name: "amount"
      TypeDefinition: "decimal"
    },
    {
      Name: "category"
      TypeDefinition: "text"
    },
    {
      Name: "code"
      TypeDefinition: "text"
    },
    {
      Name: "description"
      TypeDefinition: "text"
    },
    {
      Name: "particular"
      TypeDefinition: "text"
    },
    {
      Name: "proccessed_date"
      TypeDefinition: "timestamp"
    },
    {
      Name: "reference"
      TypeDefinition: "text"
    },
    {
      Name: "status"
      TypeDefinition: "text"
    },
    {
      Name: "product_name_ex"
      TypeDefinition: "text"
    }
  ]
}
