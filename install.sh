#! /bin/sh

DOTPATH=~/dotfiles

deploy() {

    cd $DOTPATH

    if [ $? -ne 0 ]; then           # $?: 直前に実行されたコマンドの実行結果を返す(0 or 1 or 2)
        die "not found: $DOTPATH"
    fi

    ln -snv "$HOME/dotfiles/zshrc" $HOME/.zshrc
    ln -snv "$HOME/dotfiles/tmux.conf" $HOME/.tmux.conf
    ln -snv "$HOME/dotfiles/ctags" $HOME/.ctags
    ln -snv "$HOME/dotfiles/vim-dotfiles/vimrc" $HOME/.vimrc
}

deploy

