#
#
#           █▀▀ █░░█ █▀▀ █░█ █▀▀█ █░░█
#           ▀▀▄ █▄▄█ ▀▀█ █▀▄ ░░▀▄ █▄▄█
#           ▄▄▀ ▄▄▄█ ▀▀▀ ▀░▀ █▄▄█ ▄▄▄█
#
#
# The majority of this is a base .oh-my-zsh config, with some custom bindings,
# aliases and environment variables.

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gentoo"

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
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source $HOME/scripts/zsh/zsh-vim-mode.plugin.zsh

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
#
# Custom

# Enable vim mode
set -o vi

# Aliases
alias ls="ls --color"
alias wget="wget -U 'noleak'"
alias curl="curl --user-agent 'noleak'"
alias ll="ls -lash"
alias wcopy="wl-copy -n -o" # Native Wayland clipboard
alias xcopy="xclip -sel clip -r" # X11 comptabile clipboard
alias cpu_usage="ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%cpu | head"
alias restic="sudo restic -r sftp:backupServer:/Linux/PC -p /root/.restic" # Restic for system backups
alias shred="shred -zfu"
alias mpv_query="/bin/python3 ~/.config/mpv/scripts/mpvDLNA/mpvDLNA.py -b http://mediaserver:32469/DeviceDescription.xml" # Command line query for local Plex media server
alias mpv_tv="/bin/python3 ~/.config/mpv/scripts/mpvDLNA/mpvDLNA.py -b  http://mediaserver:32469/DeviceDescription.xml f370b7391c5a624c5df3" # Shows TV stuff specifically

# Environment
export KEYTIMEOUT=1
export LD_PRELOAD=""
export EDITOR="vim"
export PATH="/bin:/usr/local/bin:/sbin:/usr/bin:/usr/sbin:$HOME/.gem/ruby/2.7.0/bin:"
export GTK_THEME="Dracula"

## Set XDG Spec Directories
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CACHE_HOME="$HOME"/.cache

## Ruby / Bundle
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle

## Go/Cargo/NPM
export GOPATH="$XDG_DATA_HOME"/go
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export SSB_HOME="$XDG_DATA_HOME"/zoom
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

## ZSH
export ZDOTDIR="$XDG_CACHE_HOME"/zsh
export HISTFILE="$XDG_CACHE_HOME"/zsh/.zsh_history

## Less
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE=- # Disable less history file

## Python
export PYLINTHOME="$XDG_DATA_HOME"/pylint

## Pass

export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass

## SSL
export NODE_EXTRA_CA_CERTS=/usr/share/ca-certificates/extra/self-signed-ca-cert.crt

# Make 'vim' open Wayland compatible fork of Emacs: https://github.com/masm11/emacs - Doom emacs is installed on top of this for vim functionality.
vim () {
  (/bin/emacsclient -c "$@" &) > /dev/null 2>&1
}

# Keybinds
bindkey "^[[C" forward-word
bindkey "^[[D" backward-word
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[216z" history-beginning-search-backward
bindkey "^[[222z" history-beginning-search-forward
