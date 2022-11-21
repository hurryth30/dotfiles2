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
./common/install_common_package.sh

# zsh
./common/setup_zsh.sh

# link dotfiles
./dot/link_dotfiles.sh

# git
./common/setup_git.sh
