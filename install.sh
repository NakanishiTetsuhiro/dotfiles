#!/bin/sh

for f in _??*
do
    ln -snfv "$f" "$HOME"/"$f"
done
