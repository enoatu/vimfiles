#!/usr/bin/env bash
set -eux

if [ ! -e ./vimrc ]; then
    printf "\e[37;41;1m Please change current directory \e[m\n"
    exit
fi

if [ -e dein ]; then
    rm -rf dein
fi

if [ -e ~/vimfiles ]; then
    ln -sf ~/vimfiles/vimrc ~/.vimrc
    ln -sf ~/vimfiles/dein.toml ~/.dein.toml
fi

mkdir -p dein/.cache/.vimrc/.dein/lib
cd ./dein/.cache/.vimrc/.dein/lib
git clone https://github.com/Shougo/vimproc.vim.git
cd vimproc.vim
make

if [ -e ./lib/vimproc_linux64.so ]; then
    ln -s vimproc.vim/lib/vimproc_linux64.so ..
elif [ -e ./lib/vimproc_mac.so ]; then
    ln -s vimproc.vim/lib/vimproc_mac.so .. #TODO
else
    printf "\e[37;41;1m Couldn't find vimproc.so \e[m\n"
    exit
fi

printf "\e[30;42;1mvim setup completed\e[m\n"
