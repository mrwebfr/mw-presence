#!/bin/bash

if ! dpkg -s 'xdotool' >/dev/null 2>&1; then
    sudo apt install xdotool
fi

##################################
# Choisissez une unité d'intervale
##################################
clear
read -p "Choisissez une unité d'intervale : 
1) Secondes 
2) Minutes 
3) Heures 
4) Quitter 

" choice

case $choice in
    1 ) unit="s";;
    2 ) unit="m";;
    3 ) unit="h";;
    4 ) exit;;
    * ) echo "Veuillez choisir une option valide.";;
esac

##################################
# Saisissez une intervale
##################################
clear
echo "Saisissez une intervale (exemple : 2, 10, 30, ...) :"
read number
interval=$number

##################################
# Actons avec la touche CTRL
##################################
clear
read -p "Actions avec la touche CTRL ? : 
1) Oui 
2) Non 
3) Quitter 

" choice

case $choice in
    1 ) active_key=true;;
    2 ) active_key=false;;
    3 ) exit;;
    * ) echo "Veuillez choisir une option valide.";;
esac

##################################
# Bouger la souris
##################################
clear
read -p "Bouger la souris ? : 
1) Oui 
2) Non 
3) Quitter 

" choice

case $choice in
    1 ) active_mouse=true;;
    2 ) active_mouse=false;;
    3 ) exit;;
    * ) echo "Veuillez choisir une option valide.";;
esac

##################################
# Clique gauche de la souris
##################################
clear
read -p "Clique gauche de la souris ? : 
1) Oui 
2) Non 
3) Quitter 

" choice

case $choice in
    1 ) active_click=true;;
    2 ) active_click=false;;
    3 ) exit;;
    * ) echo "Veuillez choisir une option valide.";;
esac

##################################
# Script
##################################
clear
i=0
while true; do
    position=$(shuf -i 200-250 -n1)

    if [ "$active_key" = true ] ; then
        sh -c "xdotool key ctrl"
    fi

    if [ "$active_mouse" = true ] ; then
        sh -c "xdotool mousemove ${position} ${position}"
    fi

    if [ "$active_click" = true ] ; then
        sh -c "xdotool click 1"
    fi

    clear
    echo "Pour quitter : CTRL + c"
    echo "-----------------------"
    echo "Vous êtes absent depuis $i${unit}"
    sleep "${interval}${unit}"
    let "i+=${interval}"
done