#!/usr/bin/env bash
rm -rf ~/.cache/dein ~/.cache/neocomplcache ~/.cache/neosnippet
cd ~/vimfiles
unlink ~/.vimrc
ln -s ~/vimfiles/.vimrc ~/.vimrc
vim +:q
mkdir -p ~/.cache/dein/.cache/.vimrc/.dein/lib
cd ~/.cache/dein/.cache/.vimrc/.dein/lib
git clone https://github.com/Shougo/vimproc.vim.git
cd vimproc.vim
make
unlink ../vimproc_linux64.so
ln -s vimproc.vim/lib/vimproc_linux64.so ..

echo "\e[30;42;1msuccess\e[m"
