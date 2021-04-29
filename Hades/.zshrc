# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/pradyungn/.oh-my-zsh"
export CHROME_EXECUTABLE="/bin/google-chrome-stable"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="pi"

alias cp="cp -i"
alias df="df -h"
alias free="free -m"
alias np="nano -w PKGBUILD"
alias bctl="bluetoothctl"
alias acli="arduino-cli"

xhost +local:root > /dev/null 2>&1

plugins=(git archlinux dirhistory extract vscode web-search)

source $ZSH/oh-my-zsh.sh

if test -t 1; then

    # see if it supports colors...
    ncolors=$(tput colors)

    if test -n "$ncolors" && test $ncolors -ge 8; then
        # figlet 'orion' | toilet -f term --gay
        pfig=(' ____  ' '|  _ \ ' '| |_) |' '|  __/ ' '|_|    ')

        nfig=(' _   _ ' '| \ | |' '|  \| |' '| |\  |' '|_| \_|')

        # for ((i=1; i<=${#pfig[@]}; i++)); do
          # echo "\033[0;35m${pfig[$i]}\033[0;34m${nfig[$i]}\033[0m";
        # done
        # echo "\033[0;32m-----------------" 
        # # | toilet -f term --gay
        # echo "\033[0;36m$(date '+%D %T')"
        # echo "\033[0;32m-----------------\033[0m" 
        echo "\033[0;33m\e[3m$(fortune)\033[0m"
        # | toilet -f term --gay         
        # devquote
        echo ""
    fi
fi

export TERM=xterm-256color
export EDITOR=nvim
