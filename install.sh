#! /bin/zsh

mkdir -p ~/.config/{nvim}
mkdir -p ~/.nvim/{undo,backup}
mkdir -p ~/.config/tmux

ln -s "$PWD/nvim" ~/.config/nvim
ln -s "$PWD/.zshrc" ~/.
ln -s "$PWD/.zsh_plugins.txt" ~/.
ls -s "$PWD/.gitconfig" ~/.
ln -s "$PWD/tmux.conf" ~/.config/tmux/.

source ~/.zshrc
