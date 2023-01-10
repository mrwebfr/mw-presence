#!/bin/bash

if ! dpkg -s 'xdotool' >/dev/null 2>&1; then
    sudo apt install xdotool
fi

##################################
# Choose an interval unit
##################################
clear
read -p "Choose an interval unit:
1) Seconds
2) minutes
3) hours
4) Exit

" choice

case $choice in
     1 ) unit="s";;
     2 ) unit="m";;
     3 ) unit="h";;
     4 ) exit;;
     * ) echo "Please choose a valid option.";;
esac

##################################
# Enter an interval
##################################
clear
echo "Enter an interval (example: 2, 10, 30, ...):"
read number
range=$number

##################################
# Let's act with the CTRL key
##################################
clear
read -p "Actions with the CTRL key?:
1) Yes
2) No
3) Exit

" choice

case $choice in
     1 ) active_key=true;;
     2 ) active_key=false;;
     3 ) exit;;
     * ) echo "Please choose a valid option.";;
esac

##################################
# Move the mouse
##################################
clear
read -p "Move mouse?:
1) Yes
2) No
3) Exit

" choice

case $choice in
     1 ) active_mouse=true;;
     2 ) active_mouse=false;;
     3 ) exit;;
     * ) echo "Please choose a valid option.";;
esac

##################################
# Left mouse click
##################################
clear
read -p "Left mouse click?:
1) Yes
2) No
3) Exit

" choice

case $choice in
     1 ) active_click=true;;
     2 ) active_click=false;;
     3 ) exit;;
     * ) echo "Please choose a valid option.";;
esac

##################################
# Script
##################################
clear
i=0
while true; do
     position=$(shuf -i 200-250 -n1)

     if [ "$active_key" = true ]; then
         sh -c "xdotool key ctrl"
     fi

     if [ "$active_mouse" = true ]; then
         sh -c "xdotool mousemove ${position} ${position}"
     fi

     if [ "$active_click" = true ]; then
         sh -c "xdotool click 1"
     fi

     clear
     echo "To exit: CTRL + c"
     echo "-----------------------"
     echo "You've been away for $i${unit}"
     sleep "${interval}${unit}"
     let "i+=${interval}"
done