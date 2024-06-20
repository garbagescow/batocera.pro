#!/bin/bash

    
    # Download the first file with suppressed background commands but showing wget progress
    echo "Downloading yuzu mainline build..."
    echo ""
    echo ""
    sleep 2
    wget --tries=10 --show-progress -O /userdata/system/switch/yuzu.AppImage "https://archive.org/download/yuzu-windows-msvc-20240304-537296095_20240305_1340/Linux/yuzu-mainline-20240304-537296095.AppImage"
    
    # Make it executable, suppress output
    chmod +x /userdata/system/switch/yuzu.AppImage &> /dev/null

    # Download the second file with suppressed background commands but showing wget progress
    echo "Downloading yuzu EA build..."
    echo""
    echo ""
    sleep 2
    wget --tries=10 --show-progress -O /userdata/system/switch/yuzuEA.AppImage "https://archive.org/download/yuzu-windows-msvc-20240304-537296095_20240305_1340/Linux/Linux-Yuzu-EA-4176.AppImage" 
    
    # Make it executable, suppress output
    chmod +x /userdata/system/switch/yuzuEA.AppImage &> /dev/null
    
    # Countdown before exiting
    echo "Downloads are done. Exiting in 5 seconds..."
    for i in {5..1}; do
        echo -ne "$i seconds remaining...\r"
        sleep 1
    done
    clear # Clear the screen after countdown
    echo "Exiting..."
  
    
    exit
else
    # Clear the screen if the user selects 'No'
    clear
    echo "Exiting..."
    exit
fi
