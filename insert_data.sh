#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams, games")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNERGOALS OPPONENTGOALS
do
  # insert winners
if [[ $WINNER != winner ]]
  then
  # get team id
  WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE  name='$WINNER'")
  # if not found
  if [[ -z $WINNER_TEAM_ID ]]
    then
      # insert Winner
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
        then
        echo "Inserted into teams, $WINNER"
      fi
  fi  
  #get new team id
  # get team id
  WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE  name='$WINNER'")
fi
if [[ $OPPONENT != opponent ]]
  then
  # get team id
  OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE  name='$OPPONENT'")
  # if not found
  if [[ -z $OPPONENT_TEAM_ID ]]
    then
      # insert OPPONENT
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
        then
        echo "Inserted into teams, $OPPONENT"
      fi
  fi  
  #get new team id
  # get team id
  OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE  name='$OPPONENT'")
fi
#insert into games
INSERT_GAMES=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_TEAM_ID,$OPPONENT_TEAM_ID,$WINNERGOALS,$OPPONENTGOALS)")
done
