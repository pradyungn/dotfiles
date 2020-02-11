# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/pradyungn/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="pi"

alias cp="cp -i"
alias df="df -h"
alias free="free -m"
alias np="nano -w PKGBUILD"
alias more=less
alias bctl="bluetoothctl"
alias dname="figlet '()RI()N'|lolcat"

xhost +local:root > /dev/null 2>&1

pmt()
{
	re='^[0-9]+$'
	if  [[ -n $1 && $1 =~ $re ]]
	then
		echo Slot specified. Uploading to Slot $1
		prosv5 mut --slot "$1"
	else
		echo Slot not specified. Defaulting to Slot 1
		prosv5 mut
	fi
}


prc()
{
	if  [ -n "$1" ]
	then
    		echo Directory Name Valid
		echo Creating Directory...
		mkdir "$1"
		echo Directory Created
		echo Copying Filesystem...
		cp -r ~/.functs/pros-src/* ./"$1"
		echo Filesystem Copied
		echo Altering Constraints
		sed -i "s/PROJECT-NAME/$1/" ./"$1"/project.pros
		echo Constraints Altered
	else
		echo "Directory name not specified"
	fi
}
# ex ()
#{
#  if [ -f $1 ] ; then
#    case $1 in
#      *.tar.bz2)   tar xjf $1   ;;
#      *.tar.gz)    tar xzf $1   ;;
#      *.bz2)       bunzip2 $1   ;;
#      *.rar)       unrar x $1     ;;
#      *.gz)        gunzip $1    ;;
#      *.tar)       tar xf $1    ;;
#      *.tbz2)      tar xjf $1   ;;
#      *.tgz)       tar xzf $1   ;;
#      *.zip)       unzip $1     ;;
#      *.Z)         uncompress $1;;
#      *.7z)        7z x $1      ;;
#      *)           echo "'$1' cannot be extracted via ex()" ;;
#    esac
#  else
#    echo "'$1' is not a valid file"
#  fi
#}

export GITKEY=f94255d7735a06ef22d3669bb4699e9b377d473c

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux dirhistory extract vscode web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH=/home/pradyungn/.local/bin:$PATH
export PATH=/home/pradyungn/gcc-arm-none-eabi/bin:$PATH
