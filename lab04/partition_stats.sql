CREATE VIEW data.partition_stats AS
	 SELECT p.relname AS partition_name,
    p.reltuples AS row_count
   FROM pg_class p
     JOIN pg_inherits i ON p.oid = i.inhrelid
     JOIN pg_class c ON i.inhparent = c.oid
WHERE c.relname = 'measurement'::name AND p.relkind = 'r'::"char" AND p.reltuples > 0::double precision
ORDER BY p.reltuples DESC;
  
  
SELECT * FROM data.partition_stats;
