#!/bin/bash
# Author: Igor Napolskikh
# Date: July 15th, 2013

echo "Initializing joystick drivers..."

TEMP_FILENAME="temp_output.txt"
GREP_STRING="/dev/input/js"

touch $TEMP_FILENAME
trap "rm -f $TEMP_FILENAME" EXIT

gnome-terminal \
--tab -e "sudo bash -c 'rmmod xpad; xboxdrv -s | tee $TEMP_FILENAME; sleep 3'" 

read -p "Press [Enter] when xboxdrv is running... "
JOY_CH=`grep $GREP_STRING $TEMP_FILENAME`
echo $JOY_CH

gnome-terminal \
--tab -e "bash -c 'roscore'" \
--tab -e "bash -c 'sleep 1; rosparam set joy_node/dev $JOY_CH; rosrun joy joy_node'" 

echo "Initialization complete."
