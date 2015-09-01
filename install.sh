#!/bin/sh

for f in _??*
do
    ln -snv "$f" "$HOME"/"${f/_/.}"
done
