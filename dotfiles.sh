#!/bin/bash

cp psqlrc ~/.psqlrc
cp zshrc ~/.zshrc

if [ ! -d  ~/.vim/bundle ]; then
    mkdir -p ~/.vim/bundle
    git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
fi

cp -r ./vim/after ~/.vim/after

if [ ! -d  ~/.vim/colors ]; then
    mkdir -p ~/.vim/colors
    wget https://raw.githubusercontent.com/gummesson/stereokai.vim/master/colors/stereokai.vim -P ~/.vim/colors
fi

# install plugins
vim +PluginInstall +qall
