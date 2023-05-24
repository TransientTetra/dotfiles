#!/bin/sh
LIST_OF_APPS="
borgbackup
cmus
easytag
file-roller
gimp
gparted
firefox
thunderbird
telegram-desktop
kitty
lutris
shotwell
vlc
vorta
youtube-dl
suckless-tools
sway
j4-dmenu-desktop
"
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y $LIST_OF_APPS

# /usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
# sudo apt install ./keyring.deb && rm -f ./keyring.deb
# echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
# sudo apt update && sudo apt install i3

ln -s ~/Projects/dotfiles/i3 ~/.config/i3
ln -s ~/Projects/dotfiles/sway ~/.config/sway
