#!/bin/bash



# Define an associative array for app names and their install commands
declare -A apps
apps=(
    # ... (populate with your apps as shown before)
    ["ARCH-CONTAINER"]="curl -Ls https://github.com/garbagescow/batocera.pro/raw/main/steam/steam.sh | bash"
    ["7ZIP"]="curl -Ls 7zip.batocera.pro | bash"
    ["86BOX"]="curl -Ls 86box.batocera.pro | bash"
    ["ALTUS"]="curl -Ls altus.batocera.pro | bash"
    ["AMAZON-LUNA"]="curl -Ls amazonluna.batocera.pro | bash"
    ["ANTIMICROX"]="curl -Ls antimicrox.batocera.pro | bash"
    ["ATOM"]="curl -Ls atom.batocera.pro | bash"
    ["BALENA-ETCHER"]="curl -Ls balena.batocera.pro | bash"
    ["BLENDER"]="curl -Ls blender.batocera.pro | bash"
    ["BRAVE"]="curl -Ls brave.batocera.pro | bash"
    ["CHIAKI"]="curl -Ls chiaki.batocera.pro | bash"
    ["CHROME"]="curl -Ls chrome.batocera.pro | bash"
    ["CHROMIUM"]="curl -Ls chromium.batocera.pro | bash"
    ["CLONEHERO"]="curl -Ls clonehero.batocera.pro | bash"
    ["COCKATRICE"]="curl -Ls cockatrice.batocera.pro | bash"
    ["CPU-X"]="curl -Ls cpux.batocera.pro | bash"
    ["DISCORD"]="curl -Ls discord.batocera.pro | bash"
    ["DOUBLE-COMMANDER"]="curl -Ls doublecmd.batocera.pro | bash"
    ["EDGE"]="curl -Ls edge.batocera.pro | bash"
    ["EKA2L1"]="curl -Ls eka.batocera.pro | bash"
    ["EXTRACT-XISO-GUI"]="curl -Ls xiso.batocera.pro | bash"
    ["FERDIUM"]="curl -Ls ferdium.batocera.pro | bash"
    ["FILEZILLA"]="curl -Ls filezilla.batocera.pro | bash"
    ["FIREFOX"]="curl -Ls firefox.batocera.pro | bash"
    ["FIREFOX-NIGHTLY"]="curl -Ls ffnightly.batocera.pro | bash"
    ["FIGHTCADE-2"]="curl -Ls fightcade.batocera.pro | bash"
    ["FOOBAR2000"]="curl -Ls foobar.batocera.pro | bash"
    ["GAME-MANAGER"]="curl -Ls gm.batocera.pro | bash"
    ["GEFORCENOW"]="curl -Ls geforcenow.batocera.pro | bash"
    ["GPARTED"]="curl -Ls gparted.batocera.pro | bash"
    ["GREENLIGHT"]="curl -Ls greenlight.batocera.pro | bash"
    ["GTHUMB"]="curl -Ls gthumb.batocera.pro | bash"
    ["HARD-INFO"]="curl -Ls hardinfo.batocera.pro | bash"
    ["HEROIC-LAUNCHER/APPIMAGE"]="curl -Ls heroic.batocera.pro | bash"
    ["HEROIC-LAUNCHER/CONTAINER"]="curl -Ls https://github.com/garbagescow/batocera.pro/raw/main/steam/steam.sh | bash"
    ["HYPER"]="curl -Ls hyper.batocera.pro | bash"
    ["ITCH"]="curl -Ls itch.batocera.pro | bash"
    ["JAVA-RUNTIME"]="curl -Ls java.batocera.pro | bash"
    ["KDENLIVE"]="curl -Ls kdenlive.batocera.pro | bash"
    ["KITTY"]="curl -Ls kitty.batocera.pro | bash"
    ["KRITA"]="curl -Ls krita.batocera.pro | bash"
    ["LIVECAPTIONS/SERVICE"]="curl -Ls livecaptions.batocera.pro | bash"
    ["LOGS"]="curl -Ls logs.batocera.pro | bash"
    ["LUDUSAVI"]="curl -Ls ludusavi.batocera.pro | bash"
    ["LUTRIS/CONTAINER"]="curl -Ls https://github.com/garbagescow/batocera.pro/raw/main/steam/steam.sh | bash"
    ["MEDIAELCH"]="curl -Ls mediaelch.batocera.pro | bash"
    ["MINECRAFT-BEDROCK-EDITION"]="curL -Ls https://raw.githubusercontent.com/uureel/batocera.pro/main/bedrock/bedrock.sh"
    ["MINECRAFT-JAVA-EDITION"]="curl -Ls minecraft.batocera.pro | bash"
    ["MOONLIGHT"]="curl -Ls moonlight.batocera.pro | bash"
    ["MPV"]="curl -Ls mpv.batocera.pro | bash"
    ["MULTIMC-LAUNCHER"]="curl -Ls multimc.batocera.pro | bash"
    ["MUSEEKS"]="curl -Ls museeks.batocera.pro | bash"
    ["MYRETROTV"]="curl -Ls myretrotv.batocera.pro | bash"
    ["NVTOP"]="curl -Ls nvtop.batocera.pro | bash"   
    ["NOMACS"]="curl -Ls nomacs.batocera.pro | bash"
    ["OBS-STUDIO"]="curl -Ls obs.batocera.pro | bash"
    ["ODIO"]="curl -Ls odio.batocera.pro | bash"
    ["OLIVE"]="curl -Ls olive.batocera.pro | bash"
    ["OPERA"]="curl -Ls opera.batocera.pro | bash"
    ["PEAZIP"]="curl -Ls peazip.batocera.pro | bash"
    ["PHOTOCOLLAGE"]="curl -Ls photocollage.batocera.pro | bash"
    ["PLEXAMP"]="curl -Ls plexamp.batocera.pro | bash"
    ["POKEMMO"]="curl -Ls pokemmo.batocera.pro | bash"
    ["PRISM-LAUNCHER"]="curl -Ls prism.batocera.pro | bash"
    ["PS2-MINUS"]="curl -Ls ps2minus.batocera.pro | bash"
    ["PS2-PLUS"]="curl -Ls ps2plus.batocera.pro | bash"
    ["PS3-PLUS"]="curl -Ls ps3plus.batocera.pro | bash"
    ["QBITTORRENT"]="curl -Ls qbittorrent.batocera.pro | bash"
    ["QDIRSTAT"]="curl -Ls qdirstat.batocera.pro | bash"
    ["RATS-SEARCH"]="curl -Ls rats.batocera.pro | bash"
    ["RHYTHMBOX"]="curl -Ls rhythmbox.batocera.pro | bash"
    ["SAK"]="curl -Ls sak.batocera.pro | bash"
    ["SAYONARA"]="curl -Ls sayonara.batocera.pro | bash"
    ["SMPLAYER"]="curl -Ls smplayer.batocera.pro | bash"
    ["SPOTIFY"]="curl -Ls spotify.batocera.pro | bash"
    ["STEAM/CONTAINER"]="curl -Ls https://github.com/garbagescow/batocera.pro/raw/main/steam/steam.sh | bash"
    ["STRAWBERRY"]="curl -Ls strawberry.batocera.pro | bash"
    ["SUBLIME-TEXT"]="curl -Ls sublime.batocera.pro | bash"
    ["SUNSHINE"]="curl -Ls sunshine.batocera.pro | bash"
    ["SWITCH-EMULATION"]="curl -Ls https://github.com/garbagescow/batocera.pro/raw/main/switch/switch.sh | bash"
    ["SYSTEM-MONITORING-CENTER"]="curl -Ls smc.batocera.pro | bash"
    ["TABBY"]="curl -Ls tabby.batocera.pro | bash"
    ["TELEGRAM"]="curl -Ls telegram.batocera.pro | bash"
    ["TOTAL-COMMANDER"]="curl -Ls totalcmd.batocera.pro | bash"
    ["TRANSMISSION"]="curl -Ls transmission.batocera.pro | bash"
    ["VIVALDI"]="curl -Ls vivaldi.batocera.pro | bash"
    ["VLC"]="curl -Ls vlc.batocera.pro | bash"
    ["WHATSAPP"]="curl -Ls whatsapp.batocera.pro | bash"
    ["WIIU-PLUS"]="curl -Ls wiiuplus.batocera.pro | bash"
    ["XARCHIVER"]="curl -Ls xarchiver.batocera.pro | bash"
    ["XCLOUD"]="curl -Ls xcloud.batocera.pro | bash"
    ["YARG/YARC-LAUNCHER"]="curl -Ls yarg.batocera.pro | bash"
    ["YOUTUBE-TV"]="curl -Ls yttv.batocera.pro | bash"
)

# Prepare array for dialog command, sorted by app name
app_list=()
for app in $(printf "%s\n" "${!apps[@]}" | sort); do
    app_list+=("$app" "" OFF)
done

# Show dialog checklist
cmd=(dialog --separate-output --checklist "Select applications to install or update:" 22 76 16)
choices=$("${cmd[@]}" "${app_list[@]}" 2>&1 >/dev/tty)

# Check if Cancel was pressed
if [ $? -eq 1 ]; then
    echo "Installation cancelled."
    exit
fi

# Install selected apps
for choice in $choices; do
    applink="$(echo "${apps[$choice]}" | awk '{print $3}')"
    rm /tmp/.app 2>/dev/null
    wget --tries=10 --no-check-certificate --no-cache --no-cookies -q -O "/tmp/.app" "$applink"
    if [[ -s "/tmp/.app" ]]; then 
        dos2unix /tmp/.app 2>/dev/null
        chmod 777 /tmp/.app 2>/dev/null
        clear
        # Run installer w/o refreshing ES
        sed 's,:1234,,g' /tmp/.app | bash
        echo -e "\n\n$choice DONE.\n\n"
    else 
        echo "Error: couldn't download installer for ${apps[$choice]}"
    fi
done

# Reload ES after installations
curl http://127.0.0.1:1234/reloadgames

echo "Exiting."
