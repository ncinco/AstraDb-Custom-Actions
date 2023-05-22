CREATE TABLE IF NOT EXISTS utilities.executed_scripts
(
	script_name TEXT,
	triggered_by TEXT,
	execution_id UUID,
	execution_timestamp TIMESTAMP,
	PRIMARY KEY ((script_name, triggered_by), execution_timestamp)
) WITH CLUSTERING ORDER BY (execution_timestamp DESC);
