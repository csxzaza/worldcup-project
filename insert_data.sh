#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.


tail -n +2 games.csv | while IFS=',' read -r year round winner opponent winner_goals opponent_goals
do
EXISTS=$($PSQL "SELECT * FROM teams WHERE name = '$name' LIMIT 1;")
if [[ "$EXISTS" == "1" ]]; then
  echo "Team with name $name already exists. Skipping insert."
else
  echo "Inserting new name: $name"
  $PSQL "INSERT INTO teams (name) VALUES('$winner');"
fi

  

done

tail -n +2 games.csv | while IFS=',' read -r year round winner opponent winner_goals opponent_goals

do
EXISTS=$($PSQL "SELECT * FROM teams WHERE name = '$name' LIMIT 1;")
if [[ "$EXISTS" == "1" ]]; then
  echo "Team with name $name already exists. Skipping insert."
else
  echo "Inserting new name: $name"
  $PSQL "INSERT INTO teams (name) VALUES('$opponent');"
fi

  

done
tail -n +2 games.csv | while IFS=',' read -r year round winner opponent winner_goals opponent_goals


do

WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$winner';") 
OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent';")
echo "inserting into games"
$PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $WINNER_ID, $OPPONENT_ID, $winner_goals, $opponent_goals);"
  

done
