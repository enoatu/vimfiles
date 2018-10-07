#!/usr/bin/env bash
set -eu

if [ -e ~/.vimrc ]; then
    unlink ~/.vimrc
fi

if [ -e ~/vimfiles ]; then
    cd ~/vimfiles
elif [ -e ~/dotfiles/vimfiles ]; then
    cd ~/dotfiles/vimfiles
else
    printf "\e[37;41;1m Please change current directory\e[m\n"
    return
fi

rm -rf dein

printf "\e[30;42;1mvimfiles uninstall completed\e[m\n"
