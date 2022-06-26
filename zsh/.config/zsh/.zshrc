#!/bin/sh
export ZDOTDIR=$HOME/.config/zsh
HISTFILE=~/.zsh_history
setopt appendhistory

# some useful options (man zshoptions)
setopt nocaseglob nocasematch
setopt autocd extendedglob nomatch menucomplete nolistambiguous
setopt interactivecomments
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit && compinit
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist

# compinit
_comp_options+=(globdots)		# include hidden files.

# colors
autoload -Uz colors && colors

# useful functions
source "$ZDOTDIR/zsh-functions"

# normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# history
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
# for more plugins: https://github.com/unixorn/awesome-zsh-plugins
# more completions https://github.com/zsh-users/zsh-completions

# environment variables set everywhere
export EDITOR="helix"
export TERMINAL="alacritty"
export BROWSER="firefox"

orhfetch
