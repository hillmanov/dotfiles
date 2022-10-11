#! /bin/zsh

mkdir -p ~/.config/{nvim}
mkdir -p ~/.nvim/{undo,backup}

ln -s "$PWD/nvim" ~/.config/nvim
ln -s "$PWD/.zshrc" ~/.
ln -s "$PWD/.zsh_plugins.txt" ~/.

antibody bundle < "$PWD/.zsh_plugins.txt" > ~/.zsh_plugins.sh

git clone --depth=1 https://github.com/savq/paq-nvim.git "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim

nvim --headless +PaqInstall +qa
nvim --headless +GoInstallBinaries +qa
nvim --headless +GoUpdateBinaries +qa
nvim --headless +UpdateRemotePlugins +qa

source ~/.zshrc
