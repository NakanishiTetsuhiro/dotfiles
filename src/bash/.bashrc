#-------------------------
# Basic settings
#-------------------------
# 上書きしたい場合は >| を使う
set -o noclobber

#-------------------------
# Alias
#-------------------------
alias l='ls -l'
alias v=vim
alias g=git
alias ch=checkout
alias co=commit
alias rm='rm -i'


#-------------------------
# Another settings
#-------------------------
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey -e '^Z' fancy-ctrl-z # Use -e: Enable emacs-mode

case ${OSTYPE} in
  darwin*)                      # Settings for OSX
    alias ls='ls -G'
    alias sed='gsed'

    export LC_ALL='ja_JP.UTF-8' # http://please-sleep.cou929.nu/python-locale-valueerror-utf-8.html

    dict() { open dict://$1; }  # Dictionary config
  ;;

  linux*)                       # Settings for Linux
    alias open=thunar
    alias pbcopy='xsel --clipboard --input'
    alias ls='ls --color=auto'

    #----- trash-cli
    # >& これでも同じ意味
    # /dev/null 常に空になるファイルのこと
    if which trash-put &> /dev/null; then
        alias rm='trash-put'
    fi
  ;;
  esac

