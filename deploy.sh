#! /bin/sh

DOTPATH=$HOME/dotfiles

deploy() {

    cd $DOTPATH

    if [ $? -ne 0 ]; then           # $?: 直前に実行されたコマンドの実行結果を返す(0 or 1 or 2)
        die "not found: $DOTPATH"
    fi

    ln -svi "$DOTPATH/zshrc" $HOME/.zshrc
    ln -svi "$DOTPATH/bashrc" $HOME/.bashrc
    ln -svi "$DOTPATH/tigrc" $HOME/.tigrc
    ln -svi "$DOTPATH/tmux.conf" $HOME/.tmux.conf
    ln -svi "$DOTPATH/ctags" $HOME/.ctags
    ln -svi "$DOTPATH/vim-dotfiles/vimrc" $HOME/.vimrc
    ln -svi "$DOTPATH/vim-dotfiles/gvimrc" $HOME/.gvimrc
}

deploy

