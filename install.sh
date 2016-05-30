#!/bin/bash

DOTPATH=~/dotfiles

deploy() {

    cd ~/dotfiles

    # $?: 直前に実行されたコマンドの実行結果を返す(0 or 1 or 2)
    if [ $? -ne 0 ]; then
        die "not found: $DOTPATH"
    fi

    # . と .. のリンクはいらないので .??* になる
    for f in _??*
    do
        ln -snv "$DOTPATH/$f" "$HOME/${f/_/.}"
    done
}

initialize() {
    
    # git が使えるなら git
    if has "git"; then
        git clone --recursive "$GITHUB_URL" "$DOTPATH"
    
    # 使えない場合は curl か wget を使用する
    elif has "curl" || has "wget"; then
        tarball="https://github.com/NakanishiTetsuhiro/dotfiles/archive/master.tar.gz"
    
        # どっちかでダウンロードして，tar に流す
        if has "curl"; then
            curl -L "$tarball"
    
        elif has "wget"; then
            wget -O - "$tarball"
    
        fi | tar xv -
    
        # 解凍したら，DOTPATH に置く
        mv -f dotfiles-master "$DOTPATH"
    
    else
        die "curl or wget required"
    fi
    
}


if [ "$1" = "deploy" -o "$1" = "d" ]; then
    deploy
elif [ "$1" = "init" -o "$1" = "i" ] ; then
    initialize
    deploy
fi

