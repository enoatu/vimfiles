#!/usr/bin/env bash
set -eu

if [ -e ~/.vimrc ]; then
    rm ~/.vimrc
fi

if [ -e ~/vimfiles ]; then
    cd ~/vimfiles
    ln -s ~/vimfiles/vimrc ~/.vimrc
elif [ -e ~/dotfiles/vimfiles ]; then
    cd ~/dotfiles/vimfiles
    sed "/let s:dein_dir/c\let s:dein_dir = expand('~/dotfiles/vimfiles/dein')" vimrc
    ln -s ~/dotfiles/vimfiles/vimrc ~/.vimrc
else
    printf "\e[37;41;1m Please change current directory\e[m\n"
    return
fi

if [ -e dein ]; then
    rm -rf dein
fi

vim +:q
mkdir -p dein/.cache/.vimrc/.dein/lib
cd dein/.cache/.vimrc/.dein/lib
git clone https://github.com/Shougo/vimproc.vim.git
cd vimproc.vim
make

if [ -e ./lib/vimproc_linux64.so ]; then
    ln -s vimproc.vim/lib/vimproc_linux64.so ..
elif [ -e ./lib/vimproc_mac.so ]; then
    ln -s vimproc.vim/lib/vimproc_mac.so .. #TODO
else
    printf "\e[37;41;1m Couldn't find vimproc.so \e[m\n"
    return
fi

printf "\e[30;42;1mvim setup completed\e[m\n"
