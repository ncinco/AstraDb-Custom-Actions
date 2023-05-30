CREATE TYPE IF NOT EXISTS accounts.relationship_info (
    tokenised_cif uuid,
    cif_number text,
    link_type text
);