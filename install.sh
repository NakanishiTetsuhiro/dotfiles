#!/bin/bash


DOTPATH=~/dotfiles


deploy() {

    cd $DOTPATH

    # $?: 直前に実行されたコマンドの実行結果を返す(0 or 1 or 2)
    if [ $? -ne 0 ]; then
        die "not found: $DOTPATH"
    fi

    # . と .. のリンクはいらないので .??* になる
    for f in _*
    do
        ln -snv "$DOTPATH/$f" "$HOME/${f/_/.}"
    done
}

deploy

