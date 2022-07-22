-- from the terminal run:
-- psql < air_traffic.sql
--  What I would really do is put all the 
-- possible destinations, countries, airlines into tables, code them, and reference them

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

-- CREATE TABLE tickets
-- (
--   id SERIAL PRIMARY KEY,
--   first_name TEXT NOT NULL,
--   last_name TEXT NOT NULL,
--   seat TEXT NOT NULL,
--   departure TIMESTAMP NOT NULL,
--   arrival TIMESTAMP NOT NULL,
--   airline TEXT NOT NULL,
--   from_city TEXT NOT NULL,
--   from_country TEXT NOT NULL,
--   to_city TEXT NOT NULL,
--   to_country TEXT NOT NULL
-- );

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE departures(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL
);
CREATE TABLE arrivals (
  id SERIAL PRIMARY KEY,
  arrival TIMESTAMP NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

CREATE TABLE tickets(
  id SERIAL PRIMARY KEY,
  departure_id INT UNIQUE REFERENCES departures,
  arrival_id INT UNIQUE REFERENCES arrivals,
  passenger_id INT UNIQUE REFERENCES passengers ON DELETE CASCADE,
  seat TEXT UNIQUE NOT NULL,
  airline_id INT NOT NULL REFERENCES airlines
);



-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

  INSERT INTO passengers (first_name, last_name) VALUES ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley');

  INSERT INTO airlines (airline) VALUES ('United'),('British Airways'),('Delta'),('TUI Fly Belgium'),('Air China'),('American Airlines'),('Avianca Brasil');
  INSERT INTO departures (departure, from_city, from_country) VALUES 
  ('2018-04-08 09:00:00', 'Washington DC', 'United States'), 
  ('2018-12-19 12:45:00', 'Tokyo', 'Japan'),
  ('2018-01-02 07:00:00', 'Los Angeles', 'United States');

  INSERT INTO arrivals (arrival, to_city, to_country) VALUES 
  ('2018-04-08 12:00:00', 'Seattle', 'United States'), 
  ('2018-12-19 16:15:00', 'London', 'United Kingdom'),
  ('2018-01-02 08:03:00', 'Las Vegas', 'United States');
  INSERT INTO tickets (departure_id, arrival_id, passenger_id, seat, airline_id) VALUES 
  (1,1,1,'33B',1),
  (2,2,2,'8a',2),
  (3,3,3,'12f',3);

-- SELECT first_name,last_name, from_country, to_country FROM tickets t
-- JOIN arrivals a on t.arrival_id = a.id
-- JOIN departures d on t.departure_id = d.id
-- Join passengers p on t.passenger_id = p.id;