#!/bin/sh

for file in $(find $HOME/dotfiles/dot -name ".*" -type f);
do
    filename=$(basename $file)
    ln -nfs ${HOME}/dotfiles/dot/${filename} ${HOME}/${filename}
done
echo "linked dotfiles."

# ssh
if [ ! -d $HOME/.ssh ]; then
    mkdir -p "$HOME/.ssh"
fi
ln -nfs $HOME/dotfiles/ssh/config $HOME/.ssh/config
