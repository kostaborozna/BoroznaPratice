 SELECT c.id,
    c.description,
    min(m.mark) AS min_date,
    max(m.mark) AS max_date,
    min((m.temperature - 32::double precision) * 5::double precision / 9::double precision) AS min_temperature_celsius,
    max((m.temperature - 32::double precision) * 5::double precision / 9::double precision) AS max_temperature_celsius,
    avg((m.temperature - 32::double precision) * 5::double precision / 9::double precision) AS avg_temperature_celsius
   FROM data.city c
     JOIN data.measurement_all m ON c.description::text = m.city::text
  WHERE m.temperature > ('-99'::integer * 5 / 9)::double precision
  GROUP BY c.id, c.description;
