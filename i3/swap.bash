if pacmd list-cards | grep 'active profile' | grep 'output:iec958-stereo' > /dev/null ; then
    echo "Swapped to headphones"
    pacmd set-card-profile alsa_card.pci-0000_0c_00.4 output:analog-surround-51+input:analog-stereo
else
    echo "Swapped to speaker"
    pacmd set-card-profile alsa_card.pci-0000_0c_00.4 output:iec958-stereo
fi

