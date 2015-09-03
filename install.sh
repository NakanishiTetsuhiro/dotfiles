#!/bin/bash
for f in _??*
do
    ln -snv "$HOME"/dotfiles/"$f" "$HOME"/"${f/_/.}"
done
