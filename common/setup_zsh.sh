#!/bin/sh

# zsh
if type zsh >/dev/null 2>&1; then
    echo "already installed zsh."
else
    sudo apt install -y zsh
    echo "installed zsh."
fi

if [ $SHELL = /usr/bin/bash ] || [ $SHELL = /bin/bash ]; then
	read -p "change shell to zsh ? (y/n): " DATA
	case "$DATA" in
		[yY])
			# sudo chsh -s $(which zsh)
			echo exec zsh >> ~/.bashrc
			echo -e "changed shell to zsh...\nmust be sign out !!"
			;;
		[nN]) echo "not change shell." ;;
		*) echo "not change shell."
	esac
else
    echo "alread default shell is zsh."
fi

# plugin
if [ ! -d $HOME/.zsh ]; then
	mkdir -p "$HOME/.zsh"
    echo "created ~/.zsh"
fi

# pure-prompt-theme
if [ ! -d $HOME/.zsh/pure ]; then
	git clone https://github.com/sindresorhus/pure.git $HOME/.zsh/pure
    echo "installed pure-prompt-theme."
fi

# syntax-highlighting
if [ ! -d $HOME/.zsh/zsh-syntax-highlighting ]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting
    echo "installed zsh-syntax-highlighting Plugin."
fi

# zsh-autosuggestions
if [ ! -d $HOME/.zsh/zsh-autosuggestions ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
	echo "installed zsh-autosuggestions Plugin"
fi
