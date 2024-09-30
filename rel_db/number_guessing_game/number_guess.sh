#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"


echo "Enter your username:"
read USERNAME

SELECTED_USERNAME=$($PSQL "SELECT username FROM player where username='$USERNAME'")
if [[ -z $SELECTED_USERNAME ]]
then
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
  CREATE_NEW_USER=$($PSQL "INSERT INTO player(username, best_game, games_played) VALUES ('$USERNAME', 0, 0)")
  BEST_GAME=-1
  GAMES_PLAYED=0
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM player where username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM player where username='$USERNAME'")
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

NUM_GUESSES=0
RANDOM_NUMBER=$((1 + RANDOM % 1000))
echo "RN: $RANDOM_NUMBER"
REGEX='^[0-9]+$'
echo "Guess the secret number between 1 and 1000:"
GUESS=-1
while [[ $GUESS -ne $RANDOM_NUMBER ]] ; do
  read GUESS
  NUM_GUESSES=$((NUM_GUESSES + 1)) 
  while [[ ! $GUESS =~ $REGEX ]] ; do
    echo That is not an integer, guess again:
    echo $GUESS
    read GUESS
  done
  if [[ $GUESS -gt $RANDOM_NUMBER ]] 
  then
    echo "It's lower than that, guess again:"
  fi
  if [[ $GUESS -lt $RANDOM_NUMBER ]] 
  then
    echo "It's higher than that, guess again:"
  fi
done


echo "You guessed it in $NUM_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"

if [[ $BEST_GAME -lt 0 ]] || [[ $NUM_GUESSES -lt $BEST_GAME ]]
then
  UPDATE_BEST_GAME=$($PSQL "UPDATE player SET best_game=$NUM_GUESSES WHERE username='$USERNAME'")
fi

GAMES_PLAYED=$((GAMES_PLAYED + 1)) 
UPDATE_GAMES_PLAYED=$($PSQL "UPDATE player SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")