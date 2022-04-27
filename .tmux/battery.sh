#!/bin/bash

get_battery(){
    charged='🔌'
    full='🔋'
    disc="⚡️ "
    etat="$(pmset -g batt)"
    battery="$(pmset -g batt)"
    battery="$(echo $battery | cut -d' ' -f8-)"
    etat="$(echo $etat | cut -d' ' -f9-)"
    battery="$(echo $battery | cut -c 1-3)"
    etat="$(echo $etat | cut -f1 -d";")"
    if [ $etat == "charging" ]
    then
        print="$charged $battery"
    fi
    if [ $etat == "charged" ]
    then
        print="$full $battery"
    fi
    if [ $etat == "discharging" ]
    then
        print="$disc $battery"
    fi
    printf '%s' $print
}

main(){
    get_battery
}

main
