CREATE TABLE data.region (
	id integer,
	decription varchar(50)
);

ALTER TABLE data.region
ADD CONSTRAINT pk_region_id PRIMARY KEY (id);


CREATE TABLE data.country (
	id integer,
	region integer,
	description varchar(50)
	);

ALTER TABLE data.country
ADD CONSTRAINT pk_coutry_id PRIMARY KEY (id);

ALTER TABLE data.country
ADD CONSTRAINT fk_contry_region 
FOREIGN KEY (region) REFERENCES data.region(id);


CREATE TABLE data.city(
	id integer,
	country integer,
	description varchar(50),
	latitude double precision,
	logtitude double precision,
	dataset varchar(10)
);

ALTER TABLE data.city
ADD CONSTRAINT pk_city_id PRIMARY KEY (id);

ALTER TABLE data.city
ADD CONSTRAINT fk_city_country 
FOREIGN KEY (country) REFERENCES data.country(id); 


CREATE TABLE data.measurement(
	city integer,
	mark timestamp without time zone,
	teparature  double precision
);

ALTER TABLE data.measurement
ADD CONSTRAINT fk_measurment_city
FOREIGN KEY (city) REFERENCES data.city(id);


CREATE TABLE data.coastilne(
	shape integer,
	setgmet integer,
	latitude  double precision,
	longitude  double precision
);
