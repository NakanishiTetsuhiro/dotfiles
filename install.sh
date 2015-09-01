#!/bin/sh

for f in _??*
do
    ln -snv "$f" "$HOME"/dotfiles/"${f/_/.}"
done
