#!/bin/bash

To_address=$1
subject=$2
alert_type=$3
MESSAGE_BODY=$(printf '%s\n' | sed -e "s/'/'\\\\''/g; ls/^/';\$s/\$/'/" )
Ip_address=$5
To_team=$6

final_body=$(sed -e "s/To_team/${To_team}/" \
                 -e "s/alert_type/${alert_type}/" \
                 -e "s/Ip_address/${Ip_address}/" \
                 -e "s/MESSAGE/${MESSAGE_BODY}/")



{
echo "To: $To_address"
echo "Subject: $Subject"
echo "Content-Type: text/html"
echo ""
echo "$final_body"
} | msmtp "$To_address"
