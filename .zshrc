if [ -f ~/.private-zshrc ]; then
  source ~/.private-zshrc
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"
DEFAULT_USER=scott

plugins=(git osx zsh-completions zsh-autosuggestions jump)
source <(antibody init)
autoload -U compinit && compinit

# User configuration
export PATH="/usr/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/Users/scott/projects/go/bin:/usr/local/lib/android-sdk-macosx/platform-tools"
export PATH="$PATH:$HOME/.cargo/bin"

export ANDROID_HOME="/Users/scott/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
 
source $ZSH/oh-my-zsh.sh
antibody bundle < ~/.zsh_plugins.txt

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

# aliases
alias dmb='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d' # Delete merged branches
alias dof='rm **/*.orig' # Delete .orig files
alias pr='open-pr develop'
alias pun='gulp run --dsEnv production'
alias gun='gulp runAll --silentQueuePolling'
alias 'git log'='nocorrect git log'
alias vim=nvim
alias vi=nvim
alias lg=lazygit

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

gpr() {
  git push origin HEAD && git open-pr "$@"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" -g "!node_modules/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias gpr="ggpush && open-pr develop"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/scott/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/scott/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/scott/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/scott/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh

# fnm
export PATH=$HOME/.fnm:$PATH
eval `fnm env`

# Virtual folders
mount_venus() {
  sshfs pi@192.168.86.188:/home ~/virtual/venus
}

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/scott/.config/yarn/global/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/scott/.config/yarn/global/node_modules/tabtab/.completions/slss.zsh
