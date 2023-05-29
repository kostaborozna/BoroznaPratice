CREATE OR REPLACE FUNCTION api.get_daily_temperatures_reduce(city_id VARCHAR(50), limit_count INTEGER, start_date DATE, end_date DATE)
  RETURNS TABLE (unix_ts BIGINT, temp_c DOUBLE PRECISION)
AS $$
BEGIN
  RETURN QUERY
  SELECT EXTRACT(EPOCH FROM mark)::BIGINT AS unix_ts, AVG((temperature - 32) * 5/9 ) AS temp_c
  FROM data.measurement
  WHERE city = city_id AND mark >= start_date AND mark <= end_date
  GROUP BY unix_ts
  ORDER BY unix_ts
  LIMIT limit_count;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM api.get_daily_temperatures_reduce('Abu Dhabi', 5, '2020-04-01', '2020-05-01');
