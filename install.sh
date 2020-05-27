#! /bin/zsh

# Install brew packages
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install ripgrep fzf neovim git lazygit sqlite luajit watch go youtube-dl rustup

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
brew cask install hiddenbar
brew cask install private-internet-access

sudo pip3 install neovim
curl -o- -L https://yarnpkg.com/install.sh | bash

"$(brew --prefix)"/opt/fzf/install

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Initialize rust compiler and package manager
rustup-init

mkdir -p ~/.config/{nvim,coc/ultisnips}
mkdir -p ~/.vim/tmp/{undo,backup}

ln -s "$PWD/coc-settings.json" ~/.config/nvim/.
ln -s "$PWD/.vimrc" ~/.config/nvim/init.vim
ln -s "$PWD/javascript.snippets" ~/.config/coc/ultisnips/.
ln -s "$PWD/go.snippets" ~/.config/coc/ultisnips/.
ln -s "$PWD/.zshrc" ~/.
ln -s "$PWD/.zsh_plugins.txt" ~/.

antibody bundle < "$PWD/zsh_plugins.txt" > ~/.zsh_plugins.sh

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

source ~/.zshrc

nvim --headless +PlugInstall +qa
nvim --headless +UpdateRemotePlugins +qa

source ~/.zshrc

touch ~/.hushlogin



# curl -LO "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf\?raw\=true" ~/Desktop/fira.ttf
