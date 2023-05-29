CREATE OR REPLACE FUNCTION api.get_region_country_count()
  RETURNS TABLE(id INTEGER, city_count INTEGER) AS
$$
BEGIN
  RETURN QUERY
  SELECT data.region.id, COUNT(data.country.id)::INTEGER AS countries
  FROM data.region 
  LEFT JOIN data.country ON data.region.id = data.country.region
  GROUP BY data.region.id
  ORDER BY countries DESC;
END;
$$
LANGUAGE plpgsql;

SELECT * FROM api.get_region_country_count();
