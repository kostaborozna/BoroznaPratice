CREATE OR REPLACE FUNCTION api.get_countries(country_searching integer) RETURNS TABLE (country_id INTEGER, country_name VARCHAR(50)) AS $$
BEGIN
  RETURN QUERY
  SELECT id AS country_id, description AS country_name
  FROM data.country
  WHERE region = country_searching;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM api.get_countries(1);
