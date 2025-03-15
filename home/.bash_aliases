
# aliases
alias pacman="sudo pacman"
alias shutdown="pacman -Syu && shutdown"
alias docker="sudo docker"
alias ls="exa"
alias vim="nvim"

export EDITOR="nvim"

. "$HOME/.cargo/env"
export PATH="$PATH:$HOME/.yarn/bin"
export PATH="$PATH:$HOME/.flutter/bin"
export CPATH="/usr/include/startup-notification-1.0"

mktmp() {
    DIR=$(mktemp -d "work.XXX")
    if [ "$?" -ne 0 ]; then
      return "$?" 2>/dev/null
      exit "$?"
    fi

    pushd $DIR >/dev/null
    bash --rcfile $HOME/.bash_tmp_env
    popd >/dev/null
    rm -r $DIR
}
