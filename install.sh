#! /bin/zsh

mkdir -p ~/.config/{nvim}
mkdir -p ~/.nvim/{undo,backup}

ln -s "$PWD/nvim" ~/.config/nvim
ln -s "$PWD/.zshrc" ~/.
ln -s "$PWD/.zsh_plugins.txt" ~/.
ls -s "$PWD/.gitconfig" ~/.

source ~/.zshrc
