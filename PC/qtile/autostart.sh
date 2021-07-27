#! /bin/sh

feh --bg-scale --randomize /home/cyrus/Images/wallpapers &
sudo wpa_supplicant -B -i wlp6s0 -c /etc/wpa_supplicant/wpa_supplicant-wlp6s0.conf &
sudo dhcpd &
sudo hdparm -y /dev/sdb &
sudo ntpd -q -g &
paru -Syyu --noconfirm &
sudo rustup update stable &
sudo updatedb 
