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
"
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y $LIST_OF_APPS
