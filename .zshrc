########################################################
#
# Author: NakanishiTetsuhiro
# Github: https://github.com/NakanishiTetsuhiro/dotfiles
#
########################################################


#-------------------------
# Prezto.
#-------------------------
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


#-------------------------
# Basic settings
#-------------------------
setopt noclobber

export XDG_CONFIG_HOME="$HOME/.config"

alias l='ls -ltr'
alias la='ls -ltra'
alias g=git


case ${OSTYPE} in
    # Settings for OSX
    darwin*)
        alias ls='ls -G'
        alias sed='gsed'

        export LC_ALL='ja_JP.UTF-8' # http://please-sleep.cou929.nu/python-locale-valueerror-utf-8.html

        alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
        alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
        export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

        dict() { open dict://$1; }  # Dictionary config
    ;;

    # Settings for Linux
    linux*)
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


#-------------------------
# zshの補完機能強化
#-------------------------
fpath=(~/zsh-completions/src $fpath)
autoload -U compinit; compinit
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


#-------------------------
# linecount
#-------------------------
linecount () {
    if [ $# -eq 1 ]; then
        awk 'END {print NR}' $1
    else
        echo "Error" 1>&2
    fi
}


#-------------------------
# Fancy-ctrl-z
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


#-------------------------
# Golang
#-------------------------
export PATH=$PATH:/usr/local/go/bin


#-------------------------
# rbenv
#-------------------------
if [ -d "${RBENV_ROOT}" ]; then
  export RBENV_ROOT="$HOME/.rbenv"
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"
fi


#-------------------------
# phpbrew
#-------------------------
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc


#-------------------------
# Docker
#-------------------------
alias drma='docker rm -v $(docker ps -aq -f status=exited)'
alias drmaf='docker rm -f -v $(docker ps -aq -f status=exited)'
