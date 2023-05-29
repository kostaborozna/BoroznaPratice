CREATE OR REPLACE FUNCTION api.get_coastline_shapes() RETURNS TABLE (
	shape_name double precision,
	points_count bigint
) AS $$
BEGIN
	RETURN QUERY
	SELECT shape, COUNT(*) AS points_count
	FROM data.coastilne
	GROUP BY shape, segment;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM api.get_coastline_shapes();
