CREATE OR REPLACE FUNCTION api.get_cities(country_search INTEGER) RETURNS TABLE (city_id INTEGER, city_name varchar(50)) AS $$
BEGIN
  RETURN QUERY
  SELECT id, description
  FROM data.city
  WHERE country_search = country;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM api.get_cities(31);
