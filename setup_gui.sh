#!/bin/sh
LIST_OF_APPS="
borgbackup
easytag
file-roller
gimp
gparted
firefox
thunderbird
telegram-desktop
kitty
lutris
meld
shotwell
vlc
vorta
suckless-tools
sway
swaybg
j4-dmenu-desktop
"
sudo apt update -y && sudo apt upgrade -y
for i in $LIST_OF_APPS; do
  sudo apt install -y $i
done

mkdir -p ~/.local/share/fonts
mkdir -p ~/Temp
TMPFILE=$(mktemp -p $HOME/Temp/)
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip -O $TMPFILE && unzip $TMPFILE \*.ttf -d ~/.local/share/fonts 
rm -f $TMPFILE
fc-cache -f -v

ln -s ~/Projects/dotfiles/i3 ~/.config/i3
ln -s ~/Projects/dotfiles/sway ~/.config/sway
ln -s ~/Projects/dotfiles/kitty/ ~/.config/kitty
