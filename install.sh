#!/bin/sh

for f in _??*
do
    echo ${f/_/.}
    ln -snfv "$f" "$HOME"/"$f"
done
