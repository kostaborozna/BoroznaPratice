CREATE OR REPLACE FUNCTION api.get_measurement_time_range(city_id VARCHAR(50))
  RETURNS TABLE (first_measurement TIMESTAMP, last_measurement TIMESTAMP)
AS $$
BEGIN
  RETURN QUERY
  SELECT MIN(mark), MAX(mark)
  FROM data.measurement
  WHERE city = city_id;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM api.get_measurement_time_range('Abu Dhabi');
