#! /bin/zsh

mkdir -p ~/.config/{nvim,coc/ultisnips}
mkdir -p ~/.vim/tmp/{undo,backup}

ln -s "$PWD/coc-settings.json" ~/.config/nvim/.
ln -s "$PWD/.vimrc" ~/.config/nvim/init.vim
ln -s "$PWD/javascript.snippets" ~/.config/coc/ultisnips/.
ln -s "$PWD/go.snippets" ~/.config/coc/ultisnips/.
ln -s "$PWD/.zshrc" ~/.
ln -s "$PWD/.zsh_plugins.txt" ~/.

antibody bundle < "$PWD/.zsh_plugins.txt" > ~/.zsh_plugins.sh

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

source ~/.zshrc

nvim --headless +PlugInstall +qa
nvim --headless +UpdateRemotePlugins +qa

source ~/.zshrc

