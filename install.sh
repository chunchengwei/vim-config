#!/bin/bash

CUR_DIR=`pwd`

# backup
mkdir -p .back
mv $HOME/{.vim,.vimrc,.vimrc.bundles} .back

# creat link
ln -s $CUR_DIR ~/.vim
ln -s $CUR_DIR/vimrc ~/.vimrc
ln -s $CUR_DIR/vimrc.bundles ~/.vimrc.bundles

# install Vundle
if [ ! -e $CUR_DIR/bundle ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git bundle/Vundle.vim
else
  cd bundle/Vundle.vim && git pull origin master
fi

# install plugin
vim +PluginInstall +qall
