#! /bin/zsh

mkdir -p ~/.config/{nvim}
mkdir -p ~/.nvim/{undo,backup}

ln -s "$PWD/nvim" ~/.config/nvim
ln -s "$PWD/.zshrc" ~/.
ln -s "$PWD/.zsh_plugins.txt" ~/.
ls -s "$PWD/.gitconfig" ~/.

antibody bundle < "$PWD/.zsh_plugins.txt" > ~/.zsh_plugins.sh

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim --headless +PackerInstall +qa
nvim --headless +GoInstallBinaries +qa
nvim --headless +GoUpdateBinaries +qa
nvim --headless +UpdateRemotePlugins +qa

source ~/.zshrc
