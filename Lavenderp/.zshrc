export ZSH="/home/pradyungn/.oh-my-zsh"

ZSH_THEME="pi"

alias cp="cp -i"
alias df="df -h"
alias free="free -m"
alias np="nano -w PKGBUILD"
alias more=less
alias bctl="bluetoothctl"
alias acli="arduino-cli"

xhost +local:root > /dev/null 2>&1

plugins=(git archlinux dirhistory extract vscode web-search)

source $ZSH/oh-my-zsh.sh

export PATH=/home/pradyungn/.local/bin:$PATH

if test -t 1; then

    ncolors=$(tput colors)

    if test -n "$ncolors" && test $ncolors -ge 8; then
        figlet 'orion' | toilet -f term --gay
        echo "-----------------" | toilet -f term --gay
        date "+%D %T" | toilet -f term --gay         
        devquote
    fi
fi

export TERM=xterm-256color
