DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;

\c soccer_league


CREATE TABLE teams (
	title text,
	place text,
	id  SERIAL PRIMARY KEY,
	coach  TEXT,
	wins INTEGER,
	losses INTEGER
);

CREATE TABLE referees (
	first_name text,
	last_name text,
	id SERIAL PRIMARY KEY
);

CREATE TABLE matches (
	home_team INTEGER UNIQUE REFERENCES teams,
	away_team INTEGER UNIQUE REFERENCES teams,
	gtime date,
	referee INTEGER REFERENCES referees,
	id SERIAL PRIMARY KEY,
	home_score INTEGER,
	away_score INTEGER
);
CREATE TABLE goals (
	first_name TEXT,
	last_name TEXT,
	match_id INTEGER REFERENCES matches,
	id SERIAL PRIMARY KEY,
	team_id INTEGER REFERENCES teams
);










