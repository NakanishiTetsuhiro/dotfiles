#!/bin/sh

for f in _??*
do
    f=${f/_/.}
    ln -snfv "$f" "$HOME"/"$f"
done
