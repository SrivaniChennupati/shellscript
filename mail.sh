#!/bin/bash

#Anyone in our project can call this script with Arguements

TO_ADDRESS=$1
SUBJECT=$2
BODY=$3
TEAM_NAME=$4
ALERT_TYPE=$5

#echo " all args :" $@
#mail command
#Body we needto prepare it using template

FINAL_BODY=$(sed -e "s|Team_Name|$TEAM_NAME|g" -e "s|Alert_Type|$ALERT_TYPE|g" -e "s|Message|$BODY|g" template.html)

echo $FINAL_BODY

echo "$fINAL_BODY" | mail -s "$SUBJECT" $TO_ADDRESS