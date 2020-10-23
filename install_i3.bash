#!/bin/sh
# Install status bar
sudo apt install -y cargo libdbus-1-dev rofi
git clone https://github.com/greshake/i3status-rust
cd i3status-rust && cargo build --release
cp -r sound i3 ~/.config
# Optional:
cp -r target/release/i3status-rs ~/bin/i3status-rs

