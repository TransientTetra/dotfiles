#!/bin/sh

LIST_OF_APPS="
bash
clang
clangd
cmus
coreutils
curl
fdisk
ffmpeg
ftp
fzf
g++
gcc
gdb
gettext
git
grep
htop
ripgrep
gzip
libssl-dev
lldb
luarocks
make
neofetch
openssl
p7zip
parted
python3
python3-pip
python3-venv
python3-virtualenv
rsync
samba
smbclient
tmux
tree
unrar
unzip
vim
w3m
wget
wl-clipboard
youtube-dl
zip
zsh
zsh-autosuggestions
zsh-syntax-highlighting
"
sudo apt update -y && sudo apt upgrade -y
for i in $LIST_OF_APPS; do
  sudo apt install -y $i
done

USER_=$(id -u -n)
NPROC=$(nproc)

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

git clone --recurse-submodules --depth 1 --shallow-submodules https://github.com/Kitware/CMake.git ~/Projects/CMake
chmod 700 ~/Projects/CMake/bootstrap
(cd ~/Projects/CMake && ./bootstrap && make -j $NPROC -C ~/Projects/CMake && sudo make -j $NPROC -C ~/Projects/CMake install)

git clone --branch release-0.10 --recurse-submodules --depth 1 --shallow-submodules https://github.com/neovim/neovim.git ~/Projects/neovim
(cd ~/Projects/neovim && make -j $NPROC CMAKE_BUILD_TYPE=Release -C ~/Projects/neovim)
(cd ~/Projects/neovim && sudo make -j $NPROC -C ~/Projects/neovim install)

python3 -m pip install pynvim
sudo npm i -g neovim
sudo chsh -s $(which zsh) $USER_

mkdir -p ~/.cache/zsh
touch ~/.cache/zsh/history

mkdir -p ~/Temp
mkdir -p ~/Projects
git clone --recurse-submodules --depth 1 --shallow-submodules https://github.com/TransientTetra/dotfiles.git ~/Projects/dotfiles/
mkdir -p ~/.config
rm -rf ~/.vimrc
rm -rf ~/.zshrc
rm -rf ~/.gitconfig
rm -rf ~/.aliases
rm -rf ~/.config/nvim
ln -s ~/Projects/dotfiles/.vimrc ~/.vimrc
ln -s ~/Projects/dotfiles/.zshrc ~/.zshrc
# we want to copy gitconfig to allow git credential configuration on the machine without introducing changes to repo as it would with ln
cp ~/Projects/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/Projects/dotfiles/.aliases ~/.aliases
# ln -s ~/Projects/dotfiles/nvim ~/.config/nvim

# Rust
curl https://sh.rustup.rs -sSf | sh -s -- -y

# AstroNvim
ln -s ~/Projects/dotfiles/astronvim/ ~/.config/nvim
nvim --headless -c 'quitall'

