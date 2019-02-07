# Welcome to Nakanishi's dotfiles

## Installation

    git clone https://github.com/NakanishiTetsuhiro/dotfiles $HOME/dotfiles
    ansible-playbook $HOME/dotfiles/ansible/deploy.yml -i $HOME/dotfiles/ansible/hosts
    brew install peco
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done

## Dependencies

- https://github.com/peco/peco
- https://github.com/sorin-ionescu/prezto

## Blog

http://kaoru6strings.hatenablog.com/

## Lincense

Nakanishi's dotfiles is released under the MIT license.
