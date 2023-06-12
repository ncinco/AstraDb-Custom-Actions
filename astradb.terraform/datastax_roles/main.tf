terraform {
  required_providers {
    astra = {
      source  = "datastax/astra"
      version = "2.1.15"
    }
  }
}

provider "astra" {
  // This is set via TF_VAR_token environment variable.
  token = var.token
}

// role policy is declared in the variables. Expand below section to include all custom roles required
locals {
  roles_data = jsondecode(templatefile("./${path.module}/roles.tpl", {
    api_read_policy  = jsonencode(var.api_read_policy)
    api_write_policy = jsonencode(var.api_write_policy)
  }))
}

resource "astra_role" "astradb_role" {
  for_each    = { for role in local.roles_data.roles : role.name => role }
  role_name   = each.value.name
  description = each.value.description
  effect      = "allow"
  resources = [
    // extract this to variable to allow team to specify
    "drn:astra:org:${var.datastax_org_id}:db:${each.value.database_id}:keyspace:${each.value.keyspace}",
  ]
  policy = each.value.policy
}
