export GOPATH=/home/tejaswidp/go_workspace
export PATH=$HOME/bin:/usr/local/bin:/home/tejaswidp/Android/Sdk/platform-tools:$GOPATH:$HOME/.scripts:$PATH
export ZSH=/home/tejaswidp/.oh-my-zsh

ZSH_THEME="bira_mine"

plugins=( git mercurial adb colored-man-pages pip fasd )

source $ZSH/oh-my-zsh.sh

bindkey -v

setxkbmap -option ctrl:swapcaps

alias zotero="~/Documents/software/Zotero_linux-x86_64/run-zotero.sh"
alias emacscn="emacsclient -c -n"
alias tmux="tmux -u"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#---music downloading----#
alias music-dl="~/Documents/play/spotify-downloader/spotdl.py -c ~/Documents/play/spotify-downloader/config.yml --song "
alias spot-dl="~/Documents/play/spotify-downloader/spotdl.py -c ~/Documents/play/spotify-downloader/config.yml  "

#open last nth chrome download
function open-dl() {
    nth_entry="`ls -t ~/TBD/undefined/| head -n $1 | tail -1`"
    echo $nth_entry
    zathura ~/TBD/undefined/$nth_entry &
    disown
}


export EDITOR="emacsclient -c -n"
export VISUAL="emacsclient -c -n"
export ALTERNATE_EDITOR=""

#zsh history completion in vi mode
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

eval "$(fasd --init auto)"

zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

#gtk bug workaround https://unix.stackexchange.com/questions/230238/starting-x-applications-from-the-terminal-and-the-warnings-that-follow
export NO_AT_BRIDGE=1
export TERM='xterm-256color'

#for the stupid arduino bug and andruino-mk
export ARDUINO_DIR=/home/tejaswidp/Documents/software/arduino-1.8.5
export ARDMK_DIR=/usr/share/arduino/
export AVR_TOOLS_DIR=/usr/include
