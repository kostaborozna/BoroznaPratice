-- Создал студент 305 группы Борозна Константин

DO $$
DECLARE
    city_table_name text;
    city_id integer;
    measurement_date date;
    measurement_temperature double precision;
BEGIN
    -- Loop through the tables in the external schema
    FOR city_table_name IN
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = 'FOREIGN'
    LOOP
        -- Check if the table name exists in the dataset field of the city table in the data schema
        EXECUTE format('SELECT id FROM data.city WHERE dataset = %L', city_table_name) INTO city_id;
        
        -- If a matching city is found, insert the measurement into the data schema's measurement table
        IF city_id IS NOT NULL THEN
        
            -- Get the measurement data from the current table in the external schema
            EXECUTE format('SELECT month, day, year, temperature FROM external.%I', city_table_name)
            INTO measurement_date, measurement_temperature;
            
            -- Insert the measurement into the data schema's measurement table
            EXECUTE format('INSERT INTO data.measurement (city, mark, temperature) VALUES (%s, %L, %s)',
                           city_id, measurement_date, measurement_temperature);
        END IF;
        
    END LOOP;
END $$;
