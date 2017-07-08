#! /bin/sh


echo "Copying .gitconfig to ~..."
cp gitconfig ~/.gitconfig
echo "Done copying .gitconfig to ~."

echo "Installing temrinfo..."
tic italic.terminfo
echo "Done Installing temrinfo..."

echo "Copying config files to ~/.config..."
mkdir -p ~/.config
cp -r config/* ~/.config
echo "Done copying config files."

echo "Installing vim-plug for neovim..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Done installing vim-plug for neovim."

echo "Installing neovim plugins..."
nvim +PlugInstall +qall --headless
echo "Done installing neovim plugins."
