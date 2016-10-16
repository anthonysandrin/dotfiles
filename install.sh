#! /bin/sh

# Git
cp gitconfig ~/.gitconfig

# Zsh
cp zshrc ~/.zshrc

# Install vim-plug for neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp -r config/* ~/.config
vim +PlugInstall +qall --headless
