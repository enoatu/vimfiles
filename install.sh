#!/usr/bin/env bash
set -eu
rm -rf ~/.cache/dein ~/.cache/neocomplcache ~/.cache/neosnippet
cd ~/vimfiles
if [ -e ~/.vimrc ]; then
    unlink ~/.vimrc
fi
ln -s ~/vimfiles/.vimrc ~/.vimrc
vim +:q
mkdir -p ~/.cache/dein/.cache/.vimrc/.dein/lib
cd ~/.cache/dein/.cache/.vimrc/.dein/lib
git clone https://github.com/Shougo/vimproc.vim.git
cd vimproc.vim
make
ln -s vimproc.vim/lib/vimproc_mac.so ..
#ln -s vimproc.vim/lib/vimproc_linux64.so ..

printf "\e[30;42;1msuccess\e[m\n"
