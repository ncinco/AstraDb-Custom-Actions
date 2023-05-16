CREATE CUSTOM INDEX IF NOT EXISTS relationships_idx
ON loans.bank_accounts_by_cif_with_relationship_map (keys(relationships))
USING 'StorageAttachedIndex';
