#!/bin/sh
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Install status bar
sudo apt-get install -y i3 cargo libdbus-1-dev i3blocks rofi compton nitrogen xdotool dunst feh
mkdir -p ~/bin
git clone https://github.com/greshake/i3status-rust ~/bin/i3status-rust
cp -r sound i3 ~/.config
cp -r i3blocks ~/.config/i3/
# Optional:
cp -r target/release/i3status-rs ~/bin/i3status-rs
/bin/bash i3-gaps.sh
