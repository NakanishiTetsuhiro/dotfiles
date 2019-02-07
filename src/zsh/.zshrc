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
export EDITOR='vim'
export VISUAL='vim'

alias l='ls -l'
alias la='ls -la'
alias g=git


case ${OSTYPE} in
    # Settings for OSX
    darwin*)
        alias ls='ls -G'
        alias sed='gsed'

        export LC_ALL='ja_JP.UTF-8' # http://please-sleep.cou929.nu/python-locale-valueerror-utf-8.html

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
# zsh common settings
#-------------------------
if [ -e ~/.zsh/completions ]; then
  fpath=(~/.zsh/completions $fpath)
fi
autoload -Uz compinit && compinit -i

#-------------------------
# zshの補完機能強化
#-------------------------
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection


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
# exports
#-------------------------
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/.config/composer/vendor/bin:$PATH

#-------------------------
# rbenv
#-------------------------
eval "$(rbenv init -)"

#-------------------------
# Docker
#-------------------------
alias dc='docker container'
alias di='docker image'
alias dv='docker volume'
alias dcc='docker-compose'

#-------------------------
# Git
#-------------------------
alias gpl='git pull'
alias gps='git push'
alias gs='git status'
alias gco='git commit'
alias gch='git checkout'
alias ga='git add'
alias gf='git fetch'

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH";

source ~/.phpbrew/bashrc
