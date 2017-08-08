#-------------------------
# Basic
#-------------------------
set -x XDG_CONFIG_HOME $HOME/.config

alias l='ls -ltr'
alias la='ls -ltra'
alias g=git
alias ch=checkout
alias co=commit
alias rm='rm -i'

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
