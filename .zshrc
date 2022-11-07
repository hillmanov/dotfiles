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

# Go
export GOPATH=/home/scott/go
PATH=$PATH:$GOPATH/bin

# aliases
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
  docker rmi -f $(docker images -a -q)
}
delete-docker-volumes() {
  docker volume rm -f $(docker volume ls -q)
}
ds() {
   docker stop $(docker ps -a -q)
}
spleeter() {
  echo "Separating into vocal and accompaniment tracks..."
  mkdir -p "$(pwd)"/output
  docker run --gpus all -v "$(pwd)"/output:/output -v "$(pwd)"/:/spleeter splitit:latest separate -p spleeter:2stems-16kHz -o /output -i /spleeter/"$1"
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

# fnm
eval "$(fnm env --use-on-cd)"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
