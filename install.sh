#! /bin/sh


echo "Copying .gitconfig to ~..."
cp gitconfig ~/.gitconfig
echo "Done copying .gitconfig to ~."

echo "Installing terminfo..."
tic italic.terminfo
echo "Done Installing temrinfo..."

echo "Copying .tmux.conf to ~..."
cp tmux.conf ~/.tmux.conf
echo "Done copying .tmux.conf to ~..."

echo "Copying .clang-format to ~..."
cp tmux.conf ~/.tmux.conf
echo "Donec opying .clang-format to ~..."

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
