CREATE DATABASE universe;

\c universe;

CREATE TABLE galaxy (
  galaxy_id serial PRIMARY KEY,
  name varchar(40) UNIQUE NOT NULL,
  has_life boolean,
  is_spherical boolean,
  age_in_mill int,
  dist_from_earth_in_ly numeric NOT NULL
);

INSERT INTO galaxy (name, has_life, is_spherical, age_in_mill, dist_from_earth_in_ly)
  VALUES 
  ('First', FALSE, TRUE, 100, 10),
  ('Second', FALSE, TRUE, 100, 10),
  ('Third', FALSE, TRUE, 100, 10),
  ('Fourth', FALSE, TRUE, 100, 10),
  ('Fifth', FALSE, TRUE, 100, 10),
  ('Sixth', FALSE, TRUE, 100, 10);

CREATE TABLE star (
  star_id serial PRIMARY KEY,
  name varchar(40) UNIQUE NOT NULL,
  has_life boolean,
  is_spherical boolean,
  age_in_mill int,
  dist_from_earth_in_ly numeric NOT NULL,
  galaxy_id integer references galaxy(galaxy_id)

);

INSERT INTO star 
  (name, has_life, is_spherical, age_in_mill, dist_from_earth_in_ly, galaxy_id)
  VALUES 
  ('First', FALSE, TRUE, 100, 10, 1),
  ('Second', FALSE, TRUE, 100, 10, 1),
  ('Third', FALSE, TRUE, 100, 10, 1),
  ('Fourth', FALSE, TRUE, 100, 10, 1),
  ('Fifth', FALSE, TRUE, 100, 10, 1),
  ('Sixth', FALSE, TRUE, 100, 10, 1);

CREATE TABLE planet (
  planet_id serial PRIMARY KEY,
  name varchar(40) UNIQUE NOT NULL,
  has_life boolean,
  is_spherical boolean,
  age_in_mill int,
  dist_from_earth_in_ly numeric NOT NULL,
  star_id integer references star(star_id)
);

INSERT INTO planet 
  (name, has_life, is_spherical, age_in_mill, dist_from_earth_in_ly, star_id)
  VALUES 
  ('First', FALSE, TRUE, 100, 10, 1),
  ('Second', FALSE, TRUE, 100, 10, 1),
  ('Third', FALSE, TRUE, 100, 10, 1),
  ('Fourth', FALSE, TRUE, 100, 10, 1),
  ('Fifth', FALSE, TRUE, 100, 10, 1),
  ('Sixth', FALSE, TRUE, 100, 10, 1),
  ('Seven', FALSE, TRUE, 100, 10, 1),
  ('Eight', FALSE, TRUE, 100, 10, 1),
  ('Nine', FALSE, TRUE, 100, 10, 1),
  ('Ten', FALSE, TRUE, 100, 10, 1),
  ('Eleven', FALSE, TRUE, 100, 10, 1),
  ('Twelve', FALSE, TRUE, 100, 10, 1);

CREATE TABLE moon (
  moon_id serial PRIMARY KEY,
  name varchar(40) UNIQUE NOT NULL,
  has_life boolean,
  is_spherical boolean,
  age_in_mill int,
  dist_from_earth_in_ly numeric NOT NULL,
  planet_id integer references planet(planet_id)
);

INSERT INTO moon 
  (name, has_life, is_spherical, age_in_mill, dist_from_earth_in_ly, planet_id)
  VALUES 
  ('First', FALSE, TRUE, 100, 10, 1),
  ('Second', FALSE, TRUE, 100, 10, 1),
  ('Third', FALSE, TRUE, 100, 10, 1),
  ('Fourth', FALSE, TRUE, 100, 10, 1),
  ('Fifth', FALSE, TRUE, 100, 10, 1),
  ('Sixth', FALSE, TRUE, 100, 10, 1),
  ('Seven', FALSE, TRUE, 100, 10, 1),
  ('Eight', FALSE, TRUE, 100, 10, 1),
  ('Nine', FALSE, TRUE, 100, 10, 1),
  ('Ten', FALSE, TRUE, 100, 10, 1),
  ('Eleven', FALSE, TRUE, 100, 10, 1),
  ('Twelve', FALSE, TRUE, 100, 10, 1),
  ('13', FALSE, TRUE, 100, 10, 1),
  ('14', FALSE, TRUE, 100, 10, 1),
  ('15', FALSE, TRUE, 100, 10, 1),
  ('16', FALSE, TRUE, 100, 10, 1),
  ('17', FALSE, TRUE, 100, 10, 1),
  ('18', FALSE, TRUE, 100, 10, 1),
  ('19', FALSE, TRUE, 100, 10, 1),
  ('20', FALSE, TRUE, 100, 10, 1);

CREATE TABLE constellation (
  constellation_id serial PRIMARY KEY,
  name varchar(40) UNIQUE NOT NULL,
  dist_from_earth_in_ly numeric NOT NULL,
  common_name text,
  galaxy_id integer references galaxy(galaxy_id)
);

INSERT INTO constellation 
  (name, dist_from_earth_in_ly, common_name, galaxy_id)
  VALUES 
  ('AX-314', 100, 'Osiris', 1),
  ('BX-314', 100, 'Orion', 1),
  ('CX-314', 100, 'Christine', 1);