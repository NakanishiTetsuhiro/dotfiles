########################################################
#
# Author: NakanishiTetsuhiro
# Github: https://github.com/NakanishiTetsuhiro/dotfiles
#
########################################################

#-------------------------
# zplug
#-------------------------
source ~/.zplug/init.zsh
# Syntax highlighting bundle. zsh-syntax-highlighting must be loaded after
# excuting compinit command and sourcing other plugins.
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Then, source plugins and add commands to $PATH
zplug load --verbose

#-------------------------
# pure
#-------------------------
autoload -U promptinit; promptinit
prompt pure

#-------------------------
# Basic
#-------------------------
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
# rbenv
#-------------------------
export PATH="$HOME/.rbenv/bin:$PATH"
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
alias gsw='git switch'
alias ga='git add'
alias gf='git fetch'
alias gbr='git branch'

#-------------------------
# MySQL
#-------------------------
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH";

#-------------------------
# Go
#-------------------------
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin

#-------------------------
# zshの補完機能強化
#-------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10240
SAVEHIST=10240
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

#-------------------------
# Integrate peco with history search
#-------------------------
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

