output "astraDBMainKeyVault_id_out" {
  description = "Output key vault id"
  value       = azurerm_key_vault.astraDBMainKeyVault.id
}

output "astraDBMainKeyVault_name_out" {
  description = "Output key vault id"
  value       = azurerm_key_vault.astraDBMainKeyVault.name
}
