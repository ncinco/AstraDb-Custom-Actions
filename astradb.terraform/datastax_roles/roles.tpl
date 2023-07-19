{
    "roles": [
        {
            "name": "API_Read-github-terraform",
            "description": "API Read role for domain integrated_prototype mike_terraform keyspace",
            "database_id": "7414b8ee-3b1f-42d0-92c8-6affb805ae1f",
            "keyspace": "mike_terraform",
            "policy": ${api_read_policy}
        },
        {
            "name": "API_Write-github-terraform",
            "description": "API Write role for domain integrated_prototype mike_terraform keyspace",
            "database_id": "7414b8ee-3b1f-42d0-92c8-6affb805ae1f",
            "keyspace": "mike_terraform",
            "policy": ${api_write_policy}
        }
    ]
}
