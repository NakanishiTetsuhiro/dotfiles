#!/bin/sh

for f in _??*
do
    ln -snv "${f/_/.}" "$HOME"/"$f"
done
