#! /bin/sh

DOTPATH=$HOME/dotfiles

deploy() {

    cd $DOTPATH

    # $?: 直前に実行されたコマンドの実行結果を返す(0 or 1 or 2)
    if [ $? -ne 0 ]; then
        die "not found: $DOTPATH"
    fi

    # シンボリックリンクだとUbuntuでうまく認識されないのでハードリンクにしてる
    ln "$DOTPATH/.config/fish/config.fish" $HOME/.config/fish/config.fish
    # ln -svi "$DOTPATH/.zshrc" $HOME/.zshrc
    # ln -svi "$DOTPATH/.bashrc" $HOME/.bashrc
    ln -svi "$DOTPATH/.tigrc" $HOME/.tigrc
    ln -svi "$DOTPATH/.tmux.conf" $HOME/.tmux.conf
    ln -svi "$DOTPATH/.ctags" $HOME/.ctags
    ln -svi "$DOTPATH/.vimrc" $HOME/.vimrc
    ln -svi "$DOTPATH/.vim/filetype.vim" $HOME/.vim/filetype.vim
    ln -svi "$DOTPATH/.vim/ftplugin" $HOME/.vim/ftplugin
    ln -svi "$DOTPATH/.gvimrc" $HOME/.gvimrc
}

deploy

