#!/bin/bash

DOTFILES_DIR="$(dirname $(readlink -f $0))"

function link_conf() {
    src=$1
    dest=$2

    if [ ! -L $dest ]; then
        echo "Linking ${DOTFILES_DIR}/${src} to ${dest}"
        ln -s $DOTFILES_DIR/$src $dest
    fi
}
echo $DOTFILES_DIR

link_conf psqlrc ~/.psqlrcl
link_conf zshrc ~/.zshrc
link_conf vimrc ~/.vimrc
link_conf .Xmodmap ~/.Xmodmap
link_conf .Xresources ~/.Xresources
link_conf .xsession ~/.xsession
link_conf .polybar.conf ~/.polybar.conf
link_conf config/termite ~/.config/termite
link_conf .gitignore  ~/.gitignore
link_conf .gitconfig  ~/.gitconfig

link_conf scripts/battery.py ~/bin/battery.py
link_conf scripts/polybar.sh ~/bin/polybar.sh
link_conf scripts/power.sh ~/bin/power.sh
link_conf scripts/rofi.sh ~/bin/rofi.sh
cp -r $DOTFILES_DIR/.lock/ ~/.lock

if [ ! -d  ~/.i3 ]; then
    ln -s $DOTFILES_DIR/.i3 ~/.i3
fi

if [ ! -d  ~/.vim/bundle ]; then
    mkdir -p ~/.vim/bundle
    git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
fi

if [ ! -d  ~/.vim/colors ]; then
    mkdir -p ~/.vim/colors
    wget https://raw.githubusercontent.com/gummesson/stereokai.vim/master/colors/stereokai.vim -P ~/.vim/colors
fi

# install plugins
vim +PluginInstall +qall
