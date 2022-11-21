#!/bin/sh

# base
./setup_base.sh

# for xfce's system
./xfce/setup_xfce_system.sh

# for linux mint's system
ln -nfs ${HOME}/dotfiles/linux_mint/.env ${HOME}/.env
cp ${HOME}/dotfiles/linux_mint/redshift.conf ${HOME}/.config/redshift.conf

# browser
./etc/setup_brave_browser.sh
