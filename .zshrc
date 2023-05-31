if [ -f ~/.private_zshrc ]; then
  source ~/.private_zshrc
fi

ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="agnoster"
DEFAULT_USER=scott

export ZSH=/usr/share/oh-my-zsh

plugins=(git jump)
autoload -U compinit && compinit

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/home/scott/.local/bin"

source $ZSH/oh-my-zsh.sh
source ~/.zsh_plugins.sh

# Load private-zshrc if it exists
if [ -f ~/.private-zshrc ]; then
  source ~/.private-zshrc
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


# aliases
alias dof='rm **/*.orig' # Delete .orig files
alias 'git log'='nocorrect git log'
alias vim=nvim
alias vi=nvim
alias lg=lazygit
alias ld='lazydocker'
alias apps='pm2 ls --sort id'

# TEMP
alias m4b-tool='docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt sandreas/m4b-tool:latest'

# Functions so that the values are executed on demand, not ~/.zshrc load time.
delete-docker-containers() {
  docker rm $(docker ps -a -q)
}
delete-docker-images() {
  docker rmi -f $(docker images -a -q)
}
delete-docker-volumes() {
  docker volume rm -f $(docker volume ls -q)
}
ds() {
   docker stop $(docker ps -a -q)
}
clearDockerLog(){
  dockerLogFile=$(docker inspect $1 | grep -G '\"LogPath\": \"*\"' | sed -e 's/.*\"LogPath\": \"//g' | sed -e 's/\",//g')
  rmCommand="rm $dockerLogFile"
  screen -d -m -S dockerlogdelete ~/Library/Containers/com.docker.docker/Data/vms/0/tty
  screen -S dockerlogdelete -p 0 -X stuff $"$rmCommand"
  screen -S dockerlogdelete -p 0 -X stuff $'\n'
  screen -S dockerlogdelete -X quit
}
open() {
  dolphin . &
}
dmb() {
  git remote prune origin
  for branch in $(git branch -a | sed 's/^\s*//' | sed 's/^remotes\///' | grep -v 'master$'); do
    last_commit_msg="$(git log --oneline --format=%f -1 $branch)"
    if [[ "$(git log --oneline --format=%f | grep $last_commit_msg | wc -l)" -eq 1 ]]; then
      echo "Deleting branch: $branch"
      git branch -D $branch &> /dev/null
    fi
  done
}
opr() {
  ggpush && git open-pr "$@"
}

function copyfile() {
  if [[ -f $1 ]]; then
    cat $1 | xclip -selection clipboard
  else
    echo "File does not exist: $1"
  fi
}

# Virtual folders
mount_venus() {
  sshfs pi@192.168.86.188:/home ~/virtual/venus
}

# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" -g "!node_modules/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export GIT_EDITOR="nvim -c 'norm gg'" 

eval "$(direnv hook zsh)"

# Make history updates happen immediately, not when the shell exits. 
setopt share_history

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

###############################################################################
# XDG Base Directory Specification
# Get stuff out of the home directory. Using recommendation from xdg-ninja.
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Set new directories for a cleaner $HOME
export ANDROID_HOME="$XDG_DATA_HOME"/android
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials                                             
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export CARGO_HOME="$XDG_DATA_HOME"/cargo 
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker 
export GNUPGHOME="$XDG_DATA_HOME"/gnupg 
export GOPATH="$XDG_DATA_HOME"/go
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc 
export KDEHOME="$XDG_CONFIG_HOME"/kde 
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export ZDOTDIR="$HOME"/.config/zsh
# Do not mess with the Xauthority file!

PATH=$PATH:$GOPATH/bin

# mv $HOME/.android $ANDROID_HOME
# mv $HOME/.aws "$XDG_CONFIG_HOME"/aws
# mv $HOME/.bash_history $HISTFILE
# mv $HOME/.cargo $CARGO_HOME
# mv $HOME/.nv $CUDA_CACHE_PATH
# mv $HOME/.docker $DOCKER_CONFIG
# mv $HOME/.gnupg $GNUPGHOME
# mv $HOME/go $GOPATH
# mv $HOME/.gtkrc-2.0 $GTK2_RC_FILES
# mv $HOME/.kde4 $KDEHOME
# mv $HOME/.lesshst $LESSHISTFILE
# mv $HOME/.node_repl_history $NODE_REPL_HISTORY
# mv $HOME/.putty "$XDG_CONFIG_HOME"/putty
# mv $HOME/.rustup $RUSTUP_HOME
# mv $HOME/.sqlite_history $SQLITE_HISTORY
# mv $HOME/.xinitrc $XINITRC
# mv $HOME/.zsh_history $HISTFILE
