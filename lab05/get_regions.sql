CREATE OR REPLACE FUNCTION api.get_regions()
  RETURNS TABLE (region_id INTEGER, region_name VARCHAR(50))
AS $$
BEGIN
  RETURN QUERY
  SELECT id, description
  FROM data.region;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM api.get_regions();
