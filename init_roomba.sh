#!/bin/bash
# Author: Igor Napolskikh
# Date: July 15th, 2013

SERIAL_DEVS=$(ls /dev/ttyUSB*)

echo "Serial device ports ..."
echo $SERIAL_DEVS

echo "Please enter the desired channel: "
read SERIAL_CH

#echo /dev/ttyUSB$SERIAL_CH
sudo chmod 777 /dev/ttyUSB$SERIAL_CH