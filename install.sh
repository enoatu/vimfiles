#!/usr/bin/env bash
set -eu
rm -rf ~/vimfiles/dein
cd ~/vimfiles
if [ -e ~/.vimrc ]; then
    unlink ~/.vimrc
fi
ln -s ~/vimfiles/.vimrc ~/.vimrc
vim +:q
mkdir -p ~/vimfiles/dein/.cache/.vimrc/.dein/lib
cd ~/vimfiles/dein/.cache/.vimrc/.dein/lib
git clone https://github.com/Shougo/vimproc.vim.git
cd vimproc.vim
make
ln -s vimproc.vim/lib/vimproc_mac.so ..
ln -s vimproc.vim/lib/vimproc_linux64.so .. #TODO

printf "\e[30;42;1msuccess\e[m\n"
