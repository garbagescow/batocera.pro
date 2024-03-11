#!/bin/bash

# Temporary directory for download
TEMP_DIR="/tmp/switchmod-download"
mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR"

# Download with wget, retry up to 10 times
wget --tries=10 -O SwitchEmuModDownloader.zip "https://github.com/amakvana/SwitchEmuModDownloader/releases/download/v1.5.1.0/SwitchEmuModDownloader-1.5.1.0-Linux-x64.zip"

# Extract to install directory
INSTALL_DIR="$HOME/pro/switchmod"
mkdir -p "$INSTALL_DIR"
unzip SwitchEmuModDownloader.zip -d "$INSTALL_DIR"

# Make it executable
chmod +x "$INSTALL_DIR/SwitchEmuModDownloader"

# Create launcher script in /userdata/roms/ports
LAUNCHER_DIR="/userdata/roms/ports"
LAUNCHER_FILE="$LAUNCHER_DIR/switchmod_launcher.sh"
mkdir -p "$LAUNCHER_DIR"

cat > "$LAUNCHER_FILE" <<EOF
#!/bin/bash
unclutter-remote -s
DISPLAY=:0.0 "$INSTALL_DIR/SwitchEmuModDownloader"
unclutter-remote -h
EOF

# Make launcher script executable
chmod +x "$LAUNCHER_FILE"

# Cleanup
rm -rf "$TEMP_DIR"
curl http://127.0.0.1:1234/reloadgames

echo "Installation and setup complete."
