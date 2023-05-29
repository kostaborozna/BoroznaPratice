CREATE OR REPLACE FUNCTION api.get_city_locations() RETURNS TABLE (identifier_city INTEGER, latitude_city DOUBLE PRECISION, longitude_city DOUBLE PRECISION) AS $$
BEGIN
  RETURN QUERY
  SELECT id, latitude, logtitude
  FROM data.city;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM api.get_city_locations();
