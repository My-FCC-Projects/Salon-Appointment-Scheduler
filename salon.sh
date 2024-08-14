#!/bin/bash

#command to connect with psql
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"  
echo -e "\n~~~~~ MY SALON ~~~~~\n"

SCHEDULE_APPOINTMENT() {
if [[ $1 ]]
then
echo -e "\n$1"
fi

echo -e "Welcome to My Salon, how can I help you?\n"
#Get available services from services table of salon database
AVAILABLE_SERVICE=$($PSQL "SELECT * FROM services")

#print list of services available
echo "$AVAILABLE_SERVICE" | while read SERVICE_ID BAR NAME
do 
echo "$SERVICE_ID) $NAME"
done

#get input of service id
read SERVICE_ID_SELECTED
#check for service name with service id
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
if [[ -z $SERVICE_NAME ]]
then
SCHEDULE_APPOINTMENT "I could not find that service. What would you like today?"
else
echo "What's your phone number?\n"
read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
echo "I don't have a record for that phone number, what's your name?"
read CUSTOMER_NAME
INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')") 
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
echo -e "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME
NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")
echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
else
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
echo -e "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME
NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")
echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
fi
fi
}

SCHEDULE_APPOINTMENT