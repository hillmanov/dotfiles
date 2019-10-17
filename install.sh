#! /bin/bash

# Install brew packages
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install ripgrep fzf neovim git lazygit sqlite awless luajit
"$(brew --prefix)"/opt/fzf/install
brew install getantibody/tap/antibody
brew install Schniz/tap/fnm
brew cask install docker
brew cask install kitematic
brew cask install iterm2
brew cask install alfred
brew cask install karabiner-elements
brew cask install postico
brew cask install rectangle
brew cask install google-chrome
brew cask install balenaetcher
brew cask install private-internet-access

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -s ./coc-settings.json ~/.config/nvim/.
ln -s ./.vimrc ~/.config/nvim/init.vim
ln -s ./javascript.snippets ~/.config/coc/ultisnips/javascriptreact.snippets
ln -s ./.zshrc ~/.
ln -s ./.zsh_plugins.txt ~/.

antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

curl -fLo "$HOME/local/share/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

source ~/.zshrc
sudo pip3 install neovim

nvim --headless +PlugInstall +qa
nvim --headless +UpdateRemotePlugins +qa

source ~/.zshrc

curl -LO "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf\?raw\=true" ~/Desktop/fira.ttf
