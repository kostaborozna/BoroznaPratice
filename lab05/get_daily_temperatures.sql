CREATE OR REPLACE FUNCTION api.get_daily_temperatures(city_id VARCHAR(50), start_date TIMESTAMP, end_date TIMESTAMP)
  RETURNS TABLE (data_mark TIMESTAMP, city_temperature DOUBLE PRECISION)
AS $$
BEGIN
  RETURN QUERY
  SELECT mark, (temperature - 32) * 5/9 AS temperature_celsius
  FROM data.measurement
  WHERE city = city_id AND mark >= start_date AND mark <= end_date;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM api.get_daily_temperatures('Abu Dhabi', '2020-04-01', '2020-05-01');
