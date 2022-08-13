#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e '\n~~~~~ MY SALON ~~~~~\n'

MAIN_MENU(){
 echo -e "\nWelcome to My Salon, how can I help you?\n"
  # Get available services
AVAILABLE_SERVICES=$($PSQL "SELECT service_id,name FROM services ORDER BY service_id")
echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
do
echo "$SERVICE_ID) $NAME"
done
read SERVICE_ID_SELECTED
if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "I could not find that service. What would you like today?"
    else
    SERVICE_FOR_APPOINTMENT=$($PSQL "SELECT service_id FROM services WHERE service_id =$SERVICE_ID_SELECTED")
    # if not available
    if [[ -z $SERVICE_ID_SELECTED ]]
    then 
    # send to main menu 
    MAIN_MENU "I could not find that service. What would you like today?"
    else
    # if service is available, ask for phone 
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    # if customer not available 
    CUSTOMER_ID_TO_FIND=$($PSQL "SELECT customer_id FROM customers WHERE phone ='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_ID_TO_FIND ]]
    then
    # ask Name and enter in DB
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    CUSTOMER_TO_ADD=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    fi
  fi
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    # select Service Name and ask for time 
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME
   APPOINTMENT_ADD=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME') ")
   echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
fi
}

MAIN_MENU
