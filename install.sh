#!/usr/bin/env bash
set -eux

main () {
    directoryCheck
    setLink
   # deinInstall
   # setupVimProc
    printf "\e[30;42;1mvim setup completed\e[m\n"
}

directoryCheck () {
    if [ ! -e ./vimrc -o ! -e ./dein.toml ]; then
        printf "\e[37;41;1m Please change current directory \e[m\n"
        exit 1
    fi
}

setLink () {
    if [ -e dein ]; then
        rm -rf dein
    fi
    # For dotfiles
    if [ -e ../../dotfiles ]; then
    	ln -sf ./dotfiles/vimfiles/vimrc ~/.vimrc
        ln -sf ./dotfiles/vimfiles/dein.toml ~/.dein.toml
    else 
        ln -sf ./vimfiles/vimrc ~/.vimrc
        ln -sf ./vimfiles/dein.toml ~/.dein.toml
    fi
}

deinInstall () {
    printf "\e[37;44;5mvim open ...\e[m\n"
    vim +:q
    printf "\e[37;44;5mvim close\e[m\n"
}

setupVimProc () {
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
}

main

