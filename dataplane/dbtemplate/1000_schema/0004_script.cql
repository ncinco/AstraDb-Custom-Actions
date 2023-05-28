CREATE CUSTOM INDEX IF NOT EXISTS relationships_idx
ON [dbtemplate].bank_accounts_by_cif_with_relationship_map (keys(relationships))
USING 'StorageAttachedIndex';