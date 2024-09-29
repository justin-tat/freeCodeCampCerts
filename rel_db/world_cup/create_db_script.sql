create database worldcup;

\c worldcup;

create table teams (
  team_id SERIAL PRIMARY KEY NOT NULL,
  name varchar(80) unique NOT NULL
);

create table games (
  game_id SERIAL PRIMARY KEY NOT NULL,
  year int NOT NULL,
  round varchar(80) NOT NULL,
  winner_id integer references teams(team_id) NOT NULL,
  opponent_id integer references teams(team_id) NOT NULL,
  winner_goals int NOT NULL,
  opponent_goals int NOT NULL
);