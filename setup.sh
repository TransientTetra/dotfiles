#!/bin/sh

apt update && apt upgrade

apt install -y cmake
apt install -y clang
apt install -y fdisk
apt install -y ffmpeg
apt install -y ftp
apt install -y fzf
apt install -y g++
apt install -y gcc
apt install -y gdb
apt install -y git
apt install -y grep
apt install -y ripgrep
apt install -y gzip
apt install -y make
apt install -y neofetch
apt install -y neovim
apt install -y nodejs
apt install -y npm
apt install -y p7zip
apt install -y parted
apt install -y python3-pip
apt install -y rsync
apt install -y samba
apt install -y smbclient
apt install -y tmux
apt install -y unrar
apt install -y unzip
apt install -y vim
apt install -y w3m
apt install -y wget
apt install -y xsel
apt install -y zip
apt install -y zsh
apt install -y zsh-autosuggestions
apt install -y zsh-syntax-highlighting

pip install pynvim
npm i -g neovim
chsh -s /usr/bin/zsh

mkdir -p ~/Projects
git clone --recurse-submodules https://github.com/TransientTetra/dotfiles.git ~/Projects/dotfiles/
ln -s ~/Projects/dotfiles/.vimrc ~/.vimrc
ln -s ~/Projects/dotfiles/.zshrc ~/.zshrc
ln -s ~/Projects/dotfiles/.gitignore ~/.gitignore
ln -s ~/Projects/dotfiles/.aliases ~/.aliases
ln -s ~/Projects/dotfiles/nvim ~/nvim

