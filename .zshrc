ZSH_DISABLE_COMPFIX="true"
if [ -f ~/.private-zshrc ]; then
  source ~/.private-zshrc
fi

# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh
ZSH_THEME="agnoster"

ENABLE_CORRECTION="true"
DEFAULT_USER=scott

plugins=(git jump)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh
source ~/.zsh_plugins.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Go
if [[ `uname` == "Darwin" ]]; then
  export GOPATH=/Users/scott/go
else
  export GOPATH=/home/scott/go
fi
PATH=$PATH:$GOPATH/bin

# aliases
alias dmb='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d' # Delete merged branches
alias dof='rm **/*.orig' # Delete .orig files
alias 'git log'='nocorrect git log'
alias vim=nvim
alias vi=nvim
alias lg=lazygit
alias ld='lazydocker'

# Functions so that the values are executed on demand, not ~/.zshrc load time.
delete-docker-containers() {
  docker rm $(docker ps -a -q)
}
delete-docker-images() {
  docker rmi -f $(docker images -q)
}
ds() {
   docker stop $(docker ps -a -q)
}
spleeter() {
  echo "Separating into vocal and accompaniment tracks..."
  mkdir -p "$(pwd)"/output
  docker run --gpus all -v "$(pwd)"/output:/output -v "$(pwd)"/:/spleeter researchdeezer/spleeter separate -p spleeter:2stems-16kHz -o /output -i /spleeter/"$1"
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

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

