#!/bin/bash

# Get the machine hardware name
architecture=$(uname -m)

# Check if the architecture is x86_64 (AMD/Intel)
if [ "$architecture" != "x86_64" ]; then
    echo "This script only runs on AMD or Intel (x86_64) CPUs, not on $architecture."
    exit 1
fi

# Define the options
OPTIONS=("1" "Arch Container (Steam, Lutris, Heroic and more apps"
         "2" "Individual Apps"

# Display the dialog and get the user choice
CHOICE=$(dialog --clear --backtitle Main Menu" \
                --title "Main Mnu" \
                --menu "Choose an option:" 20 75 3 \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear

# Act based on the user choice
case $CHOICE in
    1)
        echo "Loading Arch Menu..."
        rm /tmp/runner 2>/dev/null
        wget -q --tries=30 --no-check-certificate --no-cache --no-cookies -O /tmp/runner https://github.com/garbagescow/batocera.pro/raw/main/steam/steam.sh
        dos2unix /tmp/runner 2>/dev/null 
        chmod 777 /tmp/runner 2>/dev/null
        bash /tmp/runner
        ;;
    2)
        echo "Loading Uninstall script..."
        rm /tmp/runner 2>/dev/null
        wget -q --tries=30 --no-check-certificate --no-cache --no-cookies -O /tmp/runner https://github.com/garbagescow/batocera.pro/raw/main/app/pro.sh
        dos2unix /tmp/runner 2>/dev/null 
        chmod 777 /tmp/runner 2>/dev/null
        bash /tmp/runner
        ;;

    *)
        echo "No valid option selected or cancelled. Exiting."
        ;;
esac
