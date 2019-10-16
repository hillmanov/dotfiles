#! /bin/bash

# Install brew packages
brew install ripgrep fzf neovim git lazygit sqlite awless
brew install getantibody/tap/antibody
brew install Schniz/tap/fnm

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -s ./coc-settings.json ~/.config/nvim/.
ln -s ./.vimrc ~/.config/nvim/init.vim
ln -s ./javascript.snippets ~/.config/coc/ultisnips/javascriptreact.snippets
ln -s ./.zshrc ~/.
ln -s ./.zsh_plugins.txt ~/.

antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
