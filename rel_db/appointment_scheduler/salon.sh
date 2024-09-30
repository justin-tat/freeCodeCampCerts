#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

get_services () {
  SERVICES=$($PSQL "SELECT * from services") 
  echo "$SERVICES" | while read SERVICE_ID _ SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done
}

VALID_SERVICE=-1
echo -e "\n~~~~ Crunchwrap and Brimmsley's Salon ~~~~~\n\n Welcome to CatWorld, how can I help you?\n"

while [[ "$VALID_SERVICE" == -1 ]]; do
  get_services
  read SERVICE_ID_SELECTED
  if [[ "$SERVICE_ID_SELECTED" -gt 0 && "$SERVICE_ID_SELECTED" -lt 4 ]]; then
    break
  else 
    echo "I could not find that service. What would you like today?"
  fi
done

echo "What's your phone number?"
read CUSTOMER_PHONE
NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
CUSTOMER_NAME=$(echo $NAME | sed 's/ //g')
if [[ -z $NAME ]]
then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    NAME=$(echo $NAME | sed 's/ //g')
    SAVED_TO_TABLE_CUSTOMERS=$($PSQL "INSERT INTO customers(name,phone) VALUES('$NAME','$CUSTOMER_PHONE')")
fi
  
GET_SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
SERVICE_NAME=$(echo $GET_SERVICE_NAME| sed 's/ //g')
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME
SAVED_TO_TABLE_APPOINTMENTS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
if [[ $SAVED_TO_TABLE_APPOINTMENTS == "INSERT 0 1" ]]
then
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
fi