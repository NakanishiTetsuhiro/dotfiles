#-------------------------
# oh-my-fish configs
#-------------------------
# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# set fish_theme agnoster
set fish_theme default

#-------------------------
# Basic
#-------------------------
set -x XDG_CONFIG_HOME $HOME/.config

alias l='ls -l'
alias la='ls -la'
alias g=git
alias ch=checkout
alias co=commit
alias rm='rm -i'
alias up='cd ../'

switch (uname)
case Linux
    # alias ls='ls --color=auto'

case Darwin
    alias ls='ls -G'
    alias sed='gsed'
    # set -x LC_ALL='ja_JP.UTF-8' # http://please-sleep.cou929.nu/python-locale-valueerror-utf-8.html

end

#-------------------------
# Golang
#-------------------------
set -x GOPATH $HOME/Documents/Go

#-------------------------
# Docker
#-------------------------
alias drma='docker rm (docker ps -aq)'
alias dsa='docker stop (docker ps -a -q)'

#-------------------------
# Composer
#-------------------------
if test -e $HOME/.config/composer/vendor/bin
    set -x PATH $HOME/.config/composer/vendor/bin $PATH
end

#-------------------------
# adb command from Android studio
#-------------------------
if test -e $HOME/Library/Android/sdk/platform-tools
    set PATH $HOME/Library/Android/sdk/platform-tools $PATH
end

#-------------------------
# rbenv
#-------------------------
rbenv init - | source

#-------------------------
# nodebrew
#-------------------------
set -x PATH $HOME/.nodebrew/current/bin $PATH

