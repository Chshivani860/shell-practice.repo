#!/bin/bash

To_address=$1
subject=$2
alert_type=$3
Body=$(printf '%s\n' | sed -e "s/'/'\\\\''/g; ls/^/';\$s/\$/'/" )
Ip_address=$5
To_team=$6

final_body=$(sed -e "s/To_team/$To_team/g" -e "s/alert_type/$alert_type/g" -e "s/Ip_address/$Ip_address/g" -e "s/Body/$Body/g" templaet.html)



{
echo "To: $To_address"
echo "Subject: $Subject"
echo "Content-Type: text/html"
echo ""
echo "$final_body"
} | msmtp "$To_address"
