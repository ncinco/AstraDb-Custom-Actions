CREATE KEYSPACE ninokp
WITH replication = {
  'class': 'NetworkTopologyStrategy',
  'australiaeast': '3'
}
AND durable_writes = true;

CREATE TABLE ninokp.ninotable
(
  id UUID PRIMARY KEY,
  last_name TEXT,
  first_name TEXT
);
