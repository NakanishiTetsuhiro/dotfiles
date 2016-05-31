#!/bin/bash


DOTPATH=~/dotfiles


if [ "$#" -ne 1 -o ! -r "$1" ]; then

    echo "usage: ./install.sh -d"
    exit 1
fi


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


initialize() {
    
    # git が使えるなら git
    if hash "git"; then
        git clone --recursive "$GITHUB_URL" "$DOTPATH"
    
    # 使えない場合は curl か wget を使用する
    elif hash "curl" || has "wget"; then
        tarball="https://github.com/NakanishiTetsuhiro/dotfiles/archive/master.tar.gz"
    
        # どっちかでダウンロードして，tar に流す
        if hash "curl"; then
            curl -L "$tarball"
    
        elif hash "wget"; then
            wget -O - "$tarball"
    
        fi | tar xv -
    
        # 解凍したら，DOTPATH に置く
        mv -f dotfiles-master "$DOTPATH"
    
    else
        die "curl or wget required"
    fi
    
}


if [ "$1" = "deploy" -o "$1" = "-d" ]; then
    deploy
elif [ "$1" = "init" -o "$1" = "-i" ] ; then
    initialize
    deploy
fi

