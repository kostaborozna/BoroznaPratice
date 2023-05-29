CREATE OR REPLACE FUNCTION api.get_shape_point(search_shape_id INTEGER) 
  RETURNS TABLE (point_order INTEGER, latitude_shape DOUBLE PRECISION, longitude_shape DOUBLE PRECISION)
AS $$
BEGIN
  RETURN QUERY
  SELECT segment AS segment_of_line, latitude, longitude
  FROM data.coastline
  WHERE shape = search_shape_id
  ORDER BY segment;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM api.get_shape_point(0);
