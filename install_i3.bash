#!/bin/sh
# Install status bar
sudo apt install -y cargo libdbus-1-dev i3blocks rofi compton nitrogen xdotool dunst
git clone https://github.com/greshake/i3status-rust
cp -r sound i3 ~/.config
cp -r i3blocks ~/.config/i3/
# Optional:
cp -r target/release/i3status-rs ~/bin/i3status-rs

