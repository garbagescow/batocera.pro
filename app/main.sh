#!/bin/bash

# Color Variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the machine hardware name
architecture=$(uname -m)

# Check if the architecture is x86_64 (AMD/Intel)
if [ "$architecture" != "x86_64" ]; then
    echo -e "${RED}This script only runs on AMD or Intel (x86_64) CPUs, not on $architecture.${NC}"
    exit 1
fi

# Function to display animated title
animate_title() {
    local text="=== GarbageScow BATOCERA PRO APP INSTALLER/MANAGER ==="
    local delay=0.03

    echo -en "${YELLOW}"
    for (( i=0; i<${#text}; i++ )); do
        echo -n "${text:i:1}"
        sleep $delay
    done
    echo -e "${NC}\n"
}

# Function to display controls
display_controls() {
    echo -e "${GREEN}"
    echo "Controls:"
    echo "  Navigate with up-down-left-right"
    echo "  Select app with A/B/SPACE and execute with Start/X/Y/ENTER"
    echo -e "${NC}"
    sleep 4
}

# ASCII Art Title
ascii_art_title() {
    echo -e "${RED}"
    echo "    ___       ___       ___       ___       ___       ___   "
    echo "   /\  \     /\  \     /\  \     /\__\     /\  \     /\__\  "
    echo "  /::\  \   _\:\  \   /::\  \   /:/ _/_   /::\  \   /:/ _/_ "
    echo " /::\:\__\ /\/::\__\ /:/\:\__\ /::-"\__\ /::\:\__\ /::-"\__\\"
    echo " \/\::/  / \::/\/__/ \:\ \/__/ \;:;-",-" \;:::/  / \;:;-",-" "
    echo "   /:/  /   \:\__\    \:\__\    |:|  |    |:\/__/   |:|  |   "
    echo "   \/__/     \/__/     \/__/     \|__|     \|__|     \|__|   "
    echo -e "${NC}"
}

# Main script execution
clear
ascii_art_title
animate_title
display_controls

# Define the options
OPTIONS=("1" "Arch Container (Steam, Lutris, Heroic and more apps)" \
         "2" "Individual non-container Apps for Batocera")

# Display the dialog and get the user choice
CHOICE=$(dialog --clear --backtitle "Main Menu" \
                --title "Main Menu" \
                --menu "Choose an option:" 20 25 3 \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear

# Act based on the user choice
case $CHOICE in
    1)
        echo -e "${GREEN}Loading Arch Menu...${NC}"
        rm /tmp/runner 2>/dev/null
        wget -q --tries=30 --no-check-certificate --no-cache --no-cookies -O /tmp/runner https://github.com/garbagescow/batocera.pro/raw/main/steam/steam.sh
        dos2unix /tmp/runner 2>/dev/null 
        chmod 777 /tmp/runner 2>/dev/null
        bash /tmp/runner
        ;;
    2)
        echo -e "${GREEN}Loading App Menu...${NC}"
        rm /tmp/runner 2>/dev/null
        wget -q --tries=30 --no-check-certificate --no-cache --no-cookies -O /tmp/runner https://github.com/garbagescow/batocera.pro/raw/main/app/pro.sh
        dos2unix /tmp/runner 2>/dev/null 
        chmod 777 /tmp/runner 2>/dev/null
        bash /tmp/runner
        ;;
    *)
        echo -e "${YELLOW}No valid option selected or cancelled. Exiting.${NC}"
        ;;
esac
