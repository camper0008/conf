
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#\[\033[COLORm\]
PROMPT_COLOR="\[\033[1m\[\033[43m\]\[\033[30m\]"
CLEAR_COLOR="\[\033[0m\]"

PS1=$CLEAR_COLOR'\u '$PROMPT_COLOR' $(prompt-shortener) '$CLEAR_COLOR' \$ '

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
