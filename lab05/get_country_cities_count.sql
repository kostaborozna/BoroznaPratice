CREATE OR REPLACE FUNCTION api.get_country_cities_count()
  RETURNS TABLE(id INTEGER, city_count INTEGER) AS
$$
BEGIN
  RETURN QUERY
  SELECT data.country.id, COUNT(data.city.id)::INTEGER AS city_count
  FROM data.country 
  LEFT JOIN data.city ON data.country.id = data.city.country
  GROUP BY data.country.id
  ORDER BY city_count DESC;
END;
$$
LANGUAGE plpgsql;

SELECT * FROM api.get_country_cities_count();
