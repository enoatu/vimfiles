#!/usr/bin/env bash
rm -rf ~/.cache/dein ~/.cache/neocomplcache ~/.cache/neosnippet
cd ~/vimfiles
unlink ~/.vimrc
ln -s ~/vimfiles/.vimrc ~/.vimrc

