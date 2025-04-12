

-- Victim Dimension
CREATE TABLE dim_victim (
    victim_key SERIAL PRIMARY KEY,
    road_user_type VARCHAR(50) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    age INTEGER,
    age_group VARCHAR(20)
);

-- Crash Event Dimension 
CREATE TABLE dim_crash_event (
    crash_id SERIAL PRIMARY KEY,
    crash_event BIGINT NOT NULL,
    crash_type VARCHAR(20) NOT NULL,
    number_fatalities INTEGER NOT NULL
);

-- Date Dimension (using sequential key)
CREATE TABLE dim_date (
    date_key SERIAL PRIMARY KEY,
    year INTEGER NOT NULL,
    month INTEGER NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    day_of_week VARCHAR(20) NOT NULL,
    quarter INTEGER NOT NULL,
    season VARCHAR(10) NOT NULL
);

-- Time of Day Dimension (using sequential key)
CREATE TABLE dim_time_of_day (
    time_key SERIAL PRIMARY KEY,
    hour INTEGER NOT NULL,
    minute INTEGER NOT NULL,
    daylight_indicator VARCHAR(10) NOT NULL,
    time_category VARCHAR(20) NOT NULL
);

-- Location Dimension
CREATE TABLE dim_location (
    location_key SERIAL PRIMARY KEY,
    state VARCHAR(5) NOT NULL,
    sa4_region VARCHAR(100),
    lga_name VARCHAR(100)
);

-- Remoteness Dimension
CREATE TABLE dim_remoteness (
    remoteness_key SERIAL PRIMARY KEY,
    remoteness_area VARCHAR(50) NOT NULL
);

-- Road Characteristics Dimension
CREATE TABLE dim_road (
    road_key SERIAL PRIMARY KEY,
    road_type VARCHAR(50) NOT NULL,
    speed_limit INTEGER,
    speed_category VARCHAR(20) NOT NULL
);

-- Vehicle Involvement Dimension
CREATE TABLE dim_vehicle (
    vehicle_key SERIAL PRIMARY KEY,
    bus_involvement VARCHAR(5) NOT NULL,
    heavy_rigid_truck_involvement VARCHAR(5) NOT NULL,
    articulated_truck_involvement VARCHAR(5) NOT NULL,
    any_heavy_vehicle VARCHAR(5) NOT NULL,
    vehicle_type_count INTEGER NOT NULL
);

-- Fact Table (with updated dimension key names)
CREATE TABLE fact_crashes (
    fact_id INTEGER PRIMARY KEY,
    crash_event BIGINT NOT NULL,
    victim_key INTEGER NOT NULL,
    crash_id INTEGER NOT NULL,  
    date_key INTEGER NOT NULL,
    time_key INTEGER NOT NULL,
    location_key INTEGER NOT NULL,
    remoteness_key INTEGER NOT NULL,
    road_key INTEGER NOT NULL,
    vehicle_key INTEGER NOT NULL,
    fatalities INTEGER NOT NULL,
    CONSTRAINT fk_victim FOREIGN KEY (victim_key) REFERENCES dim_victim (victim_key),
    CONSTRAINT fk_crash_event FOREIGN KEY (crash_id) REFERENCES dim_crash_event (crash_id),
    CONSTRAINT fk_date FOREIGN KEY (date_key) REFERENCES dim_date (date_key),
    CONSTRAINT fk_time FOREIGN KEY (time_key) REFERENCES dim_time_of_day (time_key),
    CONSTRAINT fk_location FOREIGN KEY (location_key) REFERENCES dim_location (location_key),
    CONSTRAINT fk_remoteness FOREIGN KEY (remoteness_key) REFERENCES dim_remoteness (remoteness_key),
    CONSTRAINT fk_road FOREIGN KEY (road_key) REFERENCES dim_road (road_key),
    CONSTRAINT fk_vehicle FOREIGN KEY (vehicle_key) REFERENCES dim_vehicle (vehicle_key)
);

