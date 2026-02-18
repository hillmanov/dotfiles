if [ -f ~/.private_zshrc ]; then
  source ~/.private_zshrc
fi

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/home/scott/.local/bin:/home/scott/tools/bin"

autoload -Uz compinit
ZCOMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump-${ZSH_VERSION}"

if [[ ! -s $ZCOMPDUMP ]]; then
  compinit
else
  compinit -C -u -d "${ZCOMPDUMP}"
fi

ZSH_DISABLE_COMPFIX="true"
DEFAULT_USER=scott

# Always show completions for bun
compdef _gnu_generic bun

source /usr/share/zsh-antidote/antidote.zsh

ZSH=$(antidote path ohmyzsh/ohmyzsh)
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/oh-my-zsh"
[[ -d $ZSH_CACHE_DIR ]] || mkdir -p $ZSH_CACHE_DIR
antidote load $HOME/.zsh_plugins.txt
source $ZSH/oh-my-zsh.sh


# aliases
alias dof='rm **/*.orig' # Delete .orig files
alias 'git log'='nocorrect git log'
alias vim=nvim
alias vi=nvim
alias lg=lazygit
alias ld='lazydocker'
alias apps='pm2 ls --sort id'

pm2-restart() {
  if [[ -z "$1" ]]; then
    echo "Usage: pm2-restart <app_name> [config_file]"
    echo "  app_name:    Name or ID of the PM2 process"
    echo "  config_file: Optional path to ecosystem config (default: ./pm2.config.js)"
    return 1
  fi

  local app="$1"
  local config="${2:-$HOME/projects/pm2.config.js}"

  if [[ ! -f "$config" ]]; then
    echo "Config file not found: $config"
    return 1
  fi

  echo "Stopping $app..."
  pm2 stop "$app" 2>/dev/null

  echo "Deleting $app..."
  pm2 delete "$app" 2>/dev/null

  echo "Starting $app from $config..."
  pm2 start "$config" --only "$app" --update-env

  echo "Done. Current status:"
  pm2 show "$app"
}
alias m4b-tool='docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt sandreas/m4b-tool:latest'
alias tone='docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt --entrypoint /usr/local/bin/tone sandreas/m4b-tool:latest'
alias audible='docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt audible-cli:latest' # Audible CLI tool, built from ~/tools/audible-cli
alias cpwd='pwd | xclip -selection clipboard'

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

clear-docker-log(){
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
  for branch in $(git branch -a | sed 's/^\s*//' | sed 's/^remotes\///' | grep -v 'main$'); do
    last_commit_msg="$(git log --oneline --format=%f -1 $branch)"
    if [[ "$(git log --oneline --format=%f | grep $last_commit_msg | wc -l)" -eq 1 ]]; then
      echo "Deleting branch: $branch"
      git branch -D $branch &> /dev/null
    fi
  done
}

# transcribe - uses ~/tools/transcriber (run `transcribe --help` for options)

opr() {
  ggpush && git open-pr main
}

mkcd () {
  \mkdir -p "$1"
  cd "$1"
}

tempe () {
  cd "$(mktemp -d)"
  chmod -R 0700 .
  if [[ $# -eq 1 ]]; then
    \mkdir -p "$1"
    cd "$1"
    chmod -R 0700 .
  fi
}

scratch () {
  set -euo pipefail
  local file
  file="$(mktemp)"
  echo "Editing $file"
  exec "$EDITOR" "$file"
}

function copyfile() {
  if [[ -f $1 ]]; then
    cat $1 | xclip -selection clipboard
  else
    echo "File does not exist: $1"
  fi
}

function miltime() {
  local start=$(date +%s%N)
  "$@"
  local end=$(date +%s%N)
  local duration=$(bc <<< "scale=2; ($end - $start) / 1000000")
  echo "Duration: $duration ms"
}

# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" -g "!node_modules/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export GIT_EDITOR="nvim -c 'norm gg'" 

# fnm (Fast Node Manager)
eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(fnm completions --shell zsh)"

eval "$(direnv hook zsh)"
eval "$(atuin init zsh)"

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
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export HISTFILE="$XDG_STATE_HOME"/zsh/history
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
# Do not mess with the Xauthority file!

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# Android SDK & Java (using Android Studio's bundled JDK)
export JAVA_HOME="/opt/android-studio/jbr"
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export CAPACITOR_ANDROID_STUDIO_PATH="/opt/android-studio/bin/studio.sh"
export PATH=$PATH:$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin

# Go
PATH=$PATH:$GOPATH/bin

# Global node - have to configure node to install globals to this directory
PATH=$PATH:$HOME/.local/share/npm-global/bin

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# Fix zsh overrides for git
# Unset any existing shell alias or function for `diff`
unalias diff 2>/dev/null
unset -f diff 2>/dev/null

# Tmux CC session auto-rename function
# Updates tmux session names that start with CC<number> to "CC<number> - <git branch>"
update_tmux_cc_session() {
    # Check if we're in a tmux session
    if [ -n "$TMUX" ]; then
        # Get current session name
        local current_session=$(tmux display-message -p '#S')

        # Check if session starts with CC followed by a number
        if [[ $current_session =~ ^CC([0-9]+) ]]; then
            local cc_number="${match[1]}"

            # Check if we're in a git repository
            if git rev-parse --git-dir > /dev/null 2>&1; then
                # Get current branch name
                local branch_name=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

                if [ -n "$branch_name" ]; then
                    # Create new session name
                    local new_session_name="CC${cc_number} - ${branch_name}"

                    # Only rename if the name has changed
                    if [ "$current_session" != "$new_session_name" ]; then
                        tmux rename-session "$new_session_name"
                    fi
                fi
            fi
        fi
    fi
}


export PATH=$PATH:/home/scott/homelab/mygpt/llama.cpp/build/bin

# Add to precmd hook to run before each prompt
autoload -Uz add-zsh-hook
add-zsh-hook precmd update_tmux_cc_session

# Claude Global Resume - search and resume claude code conversations from anywhere
cgr() {
  local cmd
  cmd=$(/home/scott/tools/claude-global-resume/index.ts "$@")
  if [ -n "$cmd" ]; then
    eval "$cmd"
  fi
}
