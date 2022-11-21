#!/bin/sh

# system update
sudo apt -y update
sudo apt -y upgrade
sudo apt  dist-upgrade
sudo apt  autoremove
sudo apt autoclean

# timezome
sudo timedatectl set-timezone Asia/Tokyo

# common package
./install_common_package.sh

# zsh
./setup_zsh.sh

# link dotfiles
./link_dotfiles.sh

# git
./setup_git.sh
