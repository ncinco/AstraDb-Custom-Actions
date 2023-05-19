resource "astra_role" "organisationsuperuser" {
  role_name   = "Organisation Super User"
  description = "Role for member of IPE and C4E team members."
  effect      = "allow"
  resources = [
    # The following 3 resources are needed and wildcarded to associate the role to all dbs
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:${astra_database.integration_dev.id}",
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:{astra_database.integration_dev.id}:keyspace:*",
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:{astra_database.integration_dev.id}:keyspace:*:table:*"
  ]
  policy = [
    # organisation permissions
    "org-db-view", "org-user-write", "org-user-read",
    "org-db-create", "org-write", "org-read",
    "org-db-terminate", "org-role-write", "org-role-read",
    "org-db-expand", "org-external-auth-write", "org-external-auth-read",
    "org-audits-read", "org-token-write", "org-token-read",
    "org-billing-write", "org-billing-read", "org-role-delete",
    "accesslist-write", "accesslist-read", "org-db-addpeering",
    "org-cmk-write", "org-cmk-read", "db-manage-privateendpoint",
    "db-manage-region", "db-manage-thirdpartymetrics",

    # keyspace permissions
    "db-keyspace-alter", "db-keyspace-authorize", "db-keyspace-create",
    "db-keyspace-describe", "db-keyspace-drop", "db-keyspace-grant",
    "db-keyspace-modify",

    # table permissions
    "db-table-select", "db-table-grant", "db-table-modify",
    "db-table-describe", "db-table-create", "db-table-authorize",
    "db-table-alter", "db-table-drop",

    # api access permissions
    "db-graphql", "db-rest", "db-cql"
  ]
}

resource "astra_role" "apiteamdev" {
  role_name   = "API Team Dev"
  description = "Role to for API Team on Development Environment."
  effect      = "allow"
  resources = [
    # The following 3 resources are needed and wildcarded to associate the role to all dbs
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:${astra_database.integration_dev.id}",
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:{astra_database.integration_dev.id}:keyspace:*",
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:{astra_database.integration_dev.id}:keyspace:*:table:*"
  ]
  policy = [
    # organisation permissions
    "org-db-view",

    # keyspace permissions
    "db-keyspace-alter", "db-keyspace-authorize", "db-keyspace-create",
    "db-keyspace-describe", "db-keyspace-drop", "db-keyspace-grant",
    "db-keyspace-modify",

    # table permissions
    "db-table-select", "db-table-grant", "db-table-modify",
    "db-table-describe", "db-table-create", "db-table-authorize",
    "db-table-alter", "db-table-drop",

    # api access permissions
    "db-rest", "db-cql"
  ]
}

resource "astra_role" "apiteamqa" {
  role_name   = "API Team QA"
  description = "Role to for API Team on QA Environment."
  effect      = "allow"
  resources = [
    # The following 3 resources are needed and wildcarded to associate the role to all dbs
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:${astra_database.integration_qa.id}",
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:{astra_database.integration_qa.id}:keyspace:*",
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:{astra_database.integration_qa.id}:keyspace:*:table:*"
  ]
  policy = [
    # organisation permissions
    "org-db-view",

    # keyspace permissions
    "db-keyspace-describe",

    # table permissions
    "db-table-select",
    "db-table-describe",

    # api access permissions
    "db-rest", "db-cql"
  ]
}

resource "astra_role" "apireadonly" {
  role_name   = "API Read Only"
  description = "Role used by Service Domain APIs"
  effect      = "allow"
  resources = [
    # The following 3 resources are needed and wildcarded to associate the role to all dbs
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:*",
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:*:keyspace:*",
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:*:keyspace:*:table:*"
  ]
  policy = [
    # organisation permissions

    # keyspace permissions

    # table permissions
    "db-table-select",

    # api access permissions
    "db-rest"
  ]
}

resource "astra_role" "apireadwrite" {
  role_name   = "API Read / Write"
  description = "Role used read and write operations to tables."
  effect      = "allow"
  resources = [
    # The following 3 resources are needed and wildcarded to associate the role to all dbs
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:*",
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:*:keyspace:*",
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:*:keyspace:*:table:*"
  ]
  policy = [
    # organisation permissions

    # keyspace permissions

    # table permissions
    "db-table-select", "db-table-modify",

    # api access permissions
    "db-rest"
  ]
}

resource "astra_role" "pipelineagent" {
  role_name   = "Pipeline Agent"
  description = "Role used by pipeline agent to manage data and database objects."
  effect      = "allow"
  resources = [
    # The following 3 resources are needed and wildcarded to associate the role to all dbs
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:*",
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:*:keyspace:*",
    "drn:astra:org:a7db17c3-dfe1-4567-bcce-eeeb0bb2c944:db:*:keyspace:*:table:*"
  ]
  policy = [
    # organisation permissions
    "org-db-view",

    # keyspace permissions
    "db-keyspace-alter", "db-keyspace-authorize", "db-keyspace-create",
    "db-keyspace-describe", "db-keyspace-drop", "db-keyspace-grant",
    "db-keyspace-modify",

    # table permissions
    "db-table-select", "db-table-grant", "db-table-modify",
    "db-table-describe", "db-table-create", "db-table-authorize",
    "db-table-alter", "db-table-drop",

    # api access permissions
    "db-rest", "db-cql"
  ]
}