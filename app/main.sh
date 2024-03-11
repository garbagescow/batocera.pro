#!/bin/bash

# Get the machine hardware name
architecture=$(uname -m)

# Check if the architecture is x86_64 (AMD/Intel)
if [ "$architecture" != "x86_64" ]; then
    echo "This script only runs on AMD or Intel (x86_64) CPUs, not on $architecture."
    exit 1
fi

# Function to display animated title
animate_title() {
    local text="BATOCERA PRO APP INSTALLER"
    local delay=0.03
    local length=${#text}

    for (( i=0; i<length; i++ )); do
        echo -n "${text:i:1}"
        sleep $delay
    done
    echo
}

# Function to display controls
display_controls() {
    echo
    echo "Controls:"
    echo "  Navigate with up-down-left-right"
    echo "  Select app with A/B/SPACE and execute with Start/X/Y/ENTER"
    echo
    sleep 4  # Delay for 5 seconds
}

# Main script execution
clear
animate_title
display_controls


# Define the options
OPTIONS=("1" "Arch Container (Steam, Lutris, Heroic and more apps"
         "2" "Individual non-container Apps for Batocera"

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
