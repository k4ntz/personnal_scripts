# Run these commands to invert alt and opt on apple keyboards

echo options hid_apple iso_layout=0 fnmode=2 swap_opt_cmd=1 | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all
