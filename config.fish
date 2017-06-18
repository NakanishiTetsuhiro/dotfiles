#-------------------------
# oh-my-fish configs
#-------------------------
# set fish_theme agnoster

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

#-------------------------
# Basic settings
#-------------------------
set -x XDG_CONFIG_HOME $HOME/.config

alias l='ls -ltr'
alias la='ls -ltra'
alias g=git


# case ${OSTYPE} in
#     # Settings for OSX
#     darwin*)
#         alias ls='ls -G'
#         alias sed='gsed'
#
#         export LC_ALL='ja_JP.UTF-8' # http://please-sleep.cou929.nu/python-locale-valueerror-utf-8.html
#
#         alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#         alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#         export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
#
#         dict() { open dict://$1; }  # Dictionary config
#     ;;
#
#     # Settings for Linux
#     linux*)
#           alias open=thunar
#           alias pbcopy='xsel --clipboard --input'
#           alias ls='ls --color=auto'
#
#           #----- trash-cli
#           # >& これでも同じ意味
#           # /dev/null 常に空になるファイルのこと
#           if which trash-put &> /dev/null; then
#               alias rm='trash-put'
#           fi
#     ;;
# esac


#-------------------------
# Golang
#-------------------------
set -x GOPATH $HOME/Documents/Go


#-------------------------
# rbenv
#-------------------------
# if [ -d "${RBENV_ROOT}" ]; then
#   export RBENV_ROOT="$HOME/.rbenv"
#   export PATH=${HOME}/.rbenv/bin:${PATH} && \
#   eval "$(rbenv init -)"
# fi

