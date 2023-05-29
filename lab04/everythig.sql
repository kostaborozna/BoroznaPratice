CREATE VIEW data.everything AS
	  SELECT r.description AS region_description,
    c.description AS country_description,
    ci.description AS city_description,
    ci.latitude,
    ci.logtitude,
    ci.dataset
   FROM data.region r
     JOIN data.country c ON r.id = c.region
     JOIN data.city ci ON c.id = ci.country;
