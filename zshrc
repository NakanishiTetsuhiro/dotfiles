#-------------------------
# Prezto.
#-------------------------
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


#-------------------------
# Alias
#-------------------------
alias l='ls -l'
alias v=vim
alias g=git
alias ch=checkout
alias co=commit


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
  ;;
  esac


#-------------------------
# rbenv config
#-------------------------
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


#-------------------------
# export 
#-------------------------
export PATH=$HOME/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"


#-------------------------
# pyenv config
#-------------------------
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH=${PYENV_ROOT}/bin:$PATH
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
