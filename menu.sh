#!/bin/bash
# import the actions
. ./actions.sh

# create colors to use
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NONE='\033[0m'

# use this to keep track of the previous menu items
previous_menu=('a')

# the generic function to display the menu and execute the correct action 
generic_menu () {
    # pass the arrays into the function
    array1=("${!1}")
    array2=("${!2}")
    # continuously loop through the array
    while true
    do
        # keep a running count to display a selection number
        cnt_one=1
        for i in "${array1[@]}"
        do
            printf "%-4s${YELLOW}${cnt_one}) ${CYAN}${i}\n${NONE}"
            cnt_one=$((cnt_one+1))
        done
        # maybe print this each time
        printf "%-4s${RED}Enter ${YELLOW}'q' ${RED}to quit\n${NONE}"
        printf "\n%-4sSelect: "
        
        # read in the option
        read OPTION
        
        # check and make sure that input is an integer and that it's in range
        # if input is q than quit
        # else report bad parameter
        if [ "$OPTION" -eq "$OPTION" 2>/dev/null ] && [ "$OPTION" -le "${#array2[@]}" ]
        then
            ${array2[$((OPTION-1))]}
        elif [ "$OPTION" = "q" ]
        then
            printf "${RED}Adiós\n${NONE}"
            exit
        else
            printf "${RED}Unknown parameter...\n${NONE}"
            continue
        fi
    done
}

# use this to navigate back to the previous menu
action_goback() {
    # grab the last element from previous_menu and display that menu
    # get previous menu length
    pm=${#previous_menu[@]}
    pm=$((pm-2))
    parent_menu=${previous_menu[${pm}]}[@]
    # remove the last previous_menu item...unless it is a
    pm=$((pm+1))
    if [ "$pm" -gt "0" ]
    then
        unset previous_menu[pm]
    fi
    # display previous menu
    generic_menu menu_${parent_menu} action_${parent_menu}
}

# use this to navigate to submenus
action_submenu() {
    # add current submenu to tracking array
    previous_menu=("${previous_menu[@]}" "$1")
    # display submenu
    generic_menu menu_${1}[@] action_${1}[@]
}

# start it all off
printf "\n${GREEN}Welcome to the generic menu system!${NONE}\n\n"
generic_menu menu_a[@] action_a[@]
