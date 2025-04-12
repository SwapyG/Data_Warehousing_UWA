-- Load Victim Dimension
COPY dim_victim 
FROM '/private/tmp/victim_dimension.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true);

-- Load Crash Event Dimension
COPY dim_crash_event 
FROM '/private/tmp/crash_event_dimension.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true);

-- Load Date Dimension
COPY dim_date 
FROM '/private/tmp/date_dimension.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true);

-- Load Time of Day Dimension
COPY dim_time_of_day 
FROM '/private/tmp/time_of_day_dimension.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true);

-- Load Location Dimension
COPY dim_location 
FROM '/private/tmp/location_dimension.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true);

-- Load Remoteness Dimension
COPY dim_remoteness 
FROM '/private/tmp/remoteness_dimension.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true);

-- Load Road Characteristics Dimension
COPY dim_road 
FROM '/private/tmp/road_characteristics_dimension.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true);

-- Load Vehicle Involvement Dimension
COPY dim_vehicle 
FROM '/private/tmp/vehicle_involvement_dimension.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true);

-- Load Fact Table
COPY fact_crashes 
FROM '/private/tmp/act_crashes.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true);



