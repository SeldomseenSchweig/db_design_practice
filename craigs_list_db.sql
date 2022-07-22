CREATE TABLE user (
	username varchar(20) NOT NULL UNIQUE,
	email varchar(30) NOT NULL UNIQUE,
	id  SERIAL PRIMARY KEY  ,
	number_posts INT,
	phone_number INT,
	preferred_region TEXT REFERENCES regions,
	location TEXT UNIQUE,
	name varchar(40) NOT NULL,
	
);

CREATE TABLE post (
	body TEXT NOT NULL,
	author_id INT NOT NULL,
	id NULL SERIAL PRIMARY KEY ,
	category_id UNIQUE,
	region INT UNIQUE,
	location INT REFERENCES locations
	area TEXT,
	username TEXT NOT NULL,
	title varchar(50) NOT NULL,
	
);

CREATE TABLE categories (
	topic TEXT NOT NULL,
	id INT NOT NULL SERIAL UNIQUE,
	PRIMARY KEY 
);

CREATE TABLE regions (
	region TEXT UNIQUE,
	id  SERIAL PRIMARY KEY,
	
);
CREATE TABLE locations(
	location_place text UNIQUE,
	id Serial PRIMARY KEY
)

CREATE TABLE location_region(
	id SERIAL PRIMARY KEY,
	location_place INT REFERENCES locations,
	region INT UNIQUE REFERENCES regions
)




