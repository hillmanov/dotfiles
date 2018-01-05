if [ -f ~/.private-zshrc ]; then
  source ~/.private-zshrc
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"
DEFAULT_USER=scott

plugins=(git zshmarks osx)
source <(antibody init)


# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/Users/scott/projects/go/bin:/usr/local/lib/android-sdk-macosx/platform-tools"
source $ZSH/oh-my-zsh.sh

antibody bundle < ~/Documents/config/antibody.txt

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Go
export GOPATH=/Users/scott/projects/go
PATH=$PATH:$GOPATH/bin

# Android
export ANDROID_TOOLS=/usr/local/lib/android-sdk-macosx/platform-tools
export ANDROID_HOME=/usr/local/lib/android-sdk-macosx

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home"

# aliases
alias dmb='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d' # Delete merged branches
alias dof='rm **/*.orig' # Delete .orig files
alias pr='open-pr develop'
alias pun='gulp run --dsEnv production'
alias gun='gulp run'
alias delete-docker-containers="docker rm $(docker ps -a -q)"
alias delete-docker-images="docker rmi -f $(docker images -q)"
alias 'git log'='nocorrect git log'
alias vim=nvim
alias vi=nvim

# Change ulimit for nginx
ulimit -n 1024

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" -g "!node_modules/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias webservers="csshx newGrowExpress1 newGrowExpress2"

alias gpr="ggpush && open-pr develop"

source /Users/scott/.gulp-autocompletion-zsh/gulp-autocompletion.zsh
source /Users/scott/.gulp.plugin.zsh/gulp.plugin.zsh

export PATH="$PATH:`yarn global bin`"

