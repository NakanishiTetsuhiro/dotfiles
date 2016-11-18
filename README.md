# Welcome to Nakanishi's dotfiles

## Preparation

if you have your configuration file please execute the following command.(If necessary)

    mv $HOME/zshrc $HOME/.zshrc.orig
    mv $HOME/bashrc $HOME/.bashrc.orig
    mv $HOME/tmux.conf $HOME/.tmux.conf.orig
    mv $HOME/ctags $HOME/.ctags.orig
    mv $HOME/vim-dotfiles/vimrc $HOME/.vimrc.orig
    mv $HOME/vim-dotfiles/gvimrc $HOME/.gvimrc.orig

## Installation

    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    git clone https://github.com/Shougo/dein.vim.git $HOME/.cache/dein/repos/Shougo/dein.vim
    git clone https://github.com/NakanishiTetsuhiro/dotfiles $HOME/dotfiles
    $HOME/dotfiles/deploy.sh

## Dependencies

### .zshrc

- [prezto](https://github.com/sorin-ionescu/prezto)

### vimrc

- [dein.vim](https://github.com/Shougo/dein.vim)


## Blog

http://kaoru6strings.hatenablog.com/

## Lincense

Nakanishi's dotfiles is released under the MIT license.
