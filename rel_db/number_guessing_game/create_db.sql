create database number_guess;

\c number_guess;

create table player (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(22),
  best_game int,
  games_played int
);