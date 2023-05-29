CREATE OR REPLACE FUNCTION api.get_region_countries_count()
  RETURNS TABLE (region_id INTEGER, country_count BIGINT)
AS $$
BEGIN
  RETURN QUERY
  SELECT region, COUNT(*) AS countries
  FROM data.country
  GROUP BY region
  ORDER BY countries DESC;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM api.get_region_countries_count();
