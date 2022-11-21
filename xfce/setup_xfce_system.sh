#!/bin/sh

# system update
sudo apt -y update
sudo apt -y upgrade
sudo apt  dist-upgrade
sudo apt  autoremove
sudo apt autoclean

# timezome
sudo timedatectl set-timezone Asia/Tokyo

# japanese language support
sudo apt -y install language-selector-common
sudo apt -y install $(check-language-support)
sudo apt -y install firefox-locale-ja fonts-takao-mincho fonts-takao-gothic

# japanese input package
sudo apt -y install fcitx-mozc
im-config -n fcitx

# remove other input package
sudo apt -y update
sudo apt -y install zenity
sudo apt remove -y ibus-mozc
sudo apt remove -y ibus-table
sudo apt remove -y ibus-gtk
sudo apt remove -y ibus-gtk3
sudo apt remove -y ibus-gtk4
sudo apt remove -y ibus-data
sudo apt remove -y ibus

# install useful package
sudo apt -y install redshift

# change directry labels
sudo apt -y update
sudo apt -y install xdg-user-dirs-gtk 
LANG=C LC_ALL=C xdg-user-dirs-gtk-update
