-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

CREATE TABLE planets(
  id SERIAL PRIMARY KEY,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INT NOT NULL REFERENCES suns,
  galaxy INT REFERENCES galaxies,
);
CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  moon_name TEXT
);
CREATE TABLE suns(
  id SERIAL PRIMARY KEY,
  sun_name TEXT
);
CREATE TABLE galaxies(
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT
);
CREATE TABLE sun_planet (
  planet_id INT NOT NULL REFERENCES planets,
  sun_id INT NOT NULL REFERENCES suns
);
CREATE TABLE planet_moon (
  planet_id INT NOT NULL REFERENCES planets,
  moon_id INT NOT NULL REFERENCES moon
);
CREATE TABLE galaxy_planet (
  planet_id INT NOT NULL REFERENCES planets,
  galaxy_id INT NOT NULL REFERENCES galaxies
);

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');