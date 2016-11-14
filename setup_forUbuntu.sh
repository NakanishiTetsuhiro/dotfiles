sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get -y install aptitude 
sudo aptitude -y install git tig tmux htop rbenv vim

# pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

# Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

sudo chsh -s $(which zsh)

./dotfiles_linker.sh

reboot
