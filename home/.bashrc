#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PROMPT_COLOR="\[\033[1m\[\033[44m\]\[\033[30m\]"
CLEAR_COLOR="\[\033[0m\]"

#\[\033[COLORm\]
PS1=$CLEAR_COLOR'\u '$PROMPT_COLOR' $(prompt-shortener) '$CLEAR_COLOR' \$ '

#setxkbmap -layout dk
#setxkbmap -option ctrl:nocaps

# aliases
alias pacman="sudo pacman"
alias docker="sudo docker"
alias docker-compose="sudo docker-compose"

export PATH="$PATH:$HOME/.yarn/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"

export EDITOR="nvim"

# flutter dev
export PATH="$PATH:$HOME/flutter/bin"
export CHROME_EXECUTABLE="/usr/bin/chromium"
export ANDROID_SDK=$HOME/android-sdk
export ANDROID_PATH=$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools

export JAVA_HOME="/usr/lib/jvm/jre-1.8.0-openjdk"

alias convpn="sudo openvpn --config $HOME/vpn/conf.ovpn"
alias ssh="kitty +kitten ssh"

# deno based gigachad skrevet i krabbe sproget 🦀🚀
export DENO_INSTALL="/home/pieter/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
. "$HOME/.cargo/env"
