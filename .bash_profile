myLocation=$(dirname $(readlink -n $BASH_SOURCE))

source ${myLocation}/resources/git-ps1.sh
source ${myLocation}/resources/git-completion.bash

export EDITOR='vim'

export HISTCONTROL=erasedups
shopt -s histappend

export CLICOLOR=true
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

alias g='git'
alias ll='ls -alh'
alias mkdir='mkdir -p'
alias p='cd ~/Projects'
alias v='vim'

function mkd() { 
    mkdir -p "$@" && cd "$@" 
}

function rso() {
    source ~/.bash_profile
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
