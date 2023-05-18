CREATE TABLE IF NOT EXISTS loans.bank_accounts_by_cif_with_relationship_map (
    account_number text,
    account_type text,
    account_balance decimal,
    account_branch text,
    account_closure_datetime timestamp,
    account_hold_flag boolean,
    account_name text,
    account_number_tokenised uuid,
    account_open_datetime timestamp,
    available_balance decimal,
    currency text,
    product_name text,
    product_number uuid,
    relationships map<uuid, frozen<relationship_info>>,
    PRIMARY KEY (account_number, account_type)
) WITH CLUSTERING ORDER BY (account_type ASC)
    AND additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.UnifiedCompactionStrategy'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';
