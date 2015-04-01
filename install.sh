#! /bin/sh

# Vim
mkdir ~/.vim
mkdir ~/.vim/swap ~/.vim/backup ~/.vim/bundle
cp -R vim/autoload ~/.vim/autoload
cp vimrc ~/.vimrc
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim +qall

# Neovim
mkdir ~/.nvim
mkdir ~/.nvim/swap ~/.nvim/backup ~/.nvim/bundle
cp -R vim/autoload ~/.nvim/autoload
cp nvimrc ~/.nvim/
git clone https://github.com/Shougo/neobundle.vim ~/.nvim/bundle/neobundle.vim
nvim +qall

# Git
cp gitconfig ~/.gitconfig

# Zsh
cp zshrc ~/.zshrc
