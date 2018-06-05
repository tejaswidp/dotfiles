export GOPATH=/home/tejaswidp/go_workspace
export PATH=$HOME/bin:/usr/local/bin:/home/tejaswidp/Android/Sdk/platform-tools:$GOPATH:$HOME/.scripts:$PATH
export ZSH=/home/tejaswidp/.oh-my-zsh

ZSH_THEME="bira_mine"

plugins=( git mercurial adb colored-man-pages pip fasd )

source $ZSH/oh-my-zsh.sh

bindkey -v
alias zotero="~/Documents/software/Zotero_linux-x86_64/run-zotero.sh"

setxkbmap -option ctrl:swapcaps

alias emacscn="emacsclient -c -n"
alias tmux="tmux -u"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

export EDITOR="emacsclient -c -n"
export VISUAL="emacsclient -c -n"
export ALTERNATE_EDITOR=""

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

eval "$(fasd --init auto)"

zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select
