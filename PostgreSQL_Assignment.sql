-- Active: 1748095740712@@127.0.0.1@5432@conservation_db
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    region VARCHAR(255) NOT NULL
);

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(150) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
)

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers(ranger_id) ON DELETE RESTRICT,
    species_id INTEGER REFERENCES species(species_id) ON DELETE RESTRICT,
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(150) NOT NULL,
    notes VARCHAR(255) 
)

Drop TABLE sightings;

insert into rangers (name, region) values 
('Derek Fox', 'Coastal Pill');

insert into species (common_name, scientific_name, discovery_date, conservation_status) values

('Tiger', 'Panthera tigris', '2000-01-01', 'Endangered')

insert into sightings (ranger_id, species_id, sighting_time, location, notes) values
(4, 2, '2020-01-02', 'Northern Tress','very common');

SELECT* FROM rangers;
SELECT* FROM species;
SELECT* FROM sightings;

DELETE FROM sightings WHERE sighting_id = 7;

-- Problem 1
INSERT INTO rangers (name, region) VALUES ('Derek Fox', 'Coastal Plains');
-- Problem 2
SELECT species_id as unique_species_count FROM sightings GROUP BY species_id;
-- Problem 3
SELECT * FROM sightings WHERE location ILIKE '%Pass%';
-- Problem 4
SELECT name, COUNT(species_id) as total_sightings FROM sightings LEFT JOIN rangers ON sightings.ranger_id = rangers.ranger_id GROUP BY name, species_id;
-- Problem 5
SELECT common_name FROM species LEFT JOIN sightings ON species.species_id = sightings.species_id WHERE sightings.species_id IS NULL;
-- Problem 6
SELECT common_name, sighting_time, name FROM sightings
LEFT JOIN species ON sightings.species_id = species.species_id
LEFT JOIN rangers ON sightings.ranger_id = rangers.ranger_id ORDER BY sighting_time DESC LIMIT 2 ;
-- Problem 7
UPDATE species SET conservation_status = 'Historic' WHERE  extract(year from discovery_date) < 1800;
-- Problem 8
SELECT sighting_id, 
    CASE 
        WHEN extract(hour from sighting_time) < 12 THEN 'Morning' 
        WHEN extract(hour from sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon' 
        WHEN extract(hour from sighting_time) > 17 THEN 'Evening' 
    END AS "time_of_day"
 FROM sightings;
--  Problem 9
DELETE  FROM rangers WHERE ranger_id IN (SELECT rangers.ranger_id FROM rangers LEFT JOIN sightings ON rangers.ranger_id = sightings.ranger_id WHERE sightings.ranger_id IS NULL);
