# change dirname
if [ $(basename ${PWD}) != dotfiles ]; then
    mv ${PWD} $HOME/dotfiles
    echo 'changed current dirname to dotfiles.'
fi

# chmod
chmod -R 764 $HOME/dotfiles

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

# python
if [ ! -d $HOME/.pyenv ]; then
    echo "install pyenv!"
    curl https://pyenv.run | bash
    echo "install to require multiple build libraries on Ubuntu."
    sudo apt install -y build-essential libssl-dev libffi-dev software-properties-common \
    libbz2-dev libncurses-dev libncursesw5-dev libgdbm-dev liblzma-dev libsqlite3-dev tk-dev libgdbm-compat-dev libreadline-dev
    echo "install to python3.11.4"
    $HOME/.pyenv/bin/pyenv install 3.11.4
    echo "change to default python version"
    $HOME/.pyenv/bin/pyenv global 3.11.4
fi
