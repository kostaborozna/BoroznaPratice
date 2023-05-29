CREATE VIEW data.countries_city AS
SELECT data.country.id, data.country.description, COUNT(data.city.id) AS count
FROM data.country
LEFT JOIN data.city ON data.country.id = data.city.country
GROUP BY data.country.id
ORDER BY count DESC;
