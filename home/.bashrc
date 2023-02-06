
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PROMPT_COLOR="\[\033[1m\[\033[44m\]\[\033[30m\]"
CLEAR_COLOR="\[\033[0m\]"

#\[\033[COLORm\]
PS1=$CLEAR_COLOR'\u '$PROMPT_COLOR' $(prompt-shortener) '$CLEAR_COLOR' \$ '

# aliases
alias pacman="sudo pacman"
alias shutdown="pacman -Syu && shutdown"
alias docker="sudo docker"
alias docker-compose="sudo docker-compose"

export PATH="$PATH:$HOME/.cargo/bin"
export EDITOR="nvim"
