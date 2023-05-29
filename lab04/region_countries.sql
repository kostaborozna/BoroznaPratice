CREATE VIEW data.region_countries AS
SELECT data.region.id, data.region.description, COUNT(data.country.id) AS count
FROM data.region
LEFT JOIN data.country ON data.region.id = data.country.region
GROUP BY data.region.id
ORDER BY count DESC;
