#!/usr/bin/env zsh
#   _________  _   _ ____   ____
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |
# _ / /_ ___) |  _  |  _ <| |___
#(_)____|____/|_| |_|_| \_\\____|
#

# select history file
export HISTFILE=~/.zsh_history
export HISTSIZE=2000
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space

# subl alias
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# fn + delete
bindkey '\e[3~' delete-char
# binding key for history
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
# edit command in emacs
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^[e" edit-command-line

# 42 special infos
export STUDENTS42="crenault:yderosie"
function get_students_hosts() {

    #local students=$(echo $STUDENTS42 | tr ":" " ")
    for s in $(echo $STUDENTS42 | tr ":" " "); do
       echo $s
    done
}

# is brew up to date ? (good?)
#(brew update > /dev/null) &

# custom prompt
source ~/.prompt.zsh

# Complétion
fpath=(/usr/local/Cellar/zsh-completions/0.11.0/share/zsh-completions $fpath)
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

# Crée un cache des complétion possibles
# très utile pour les complétion qui demandent beaucoup de temps
# comme la recherche d'un paquet aptitude install moz<tab>
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache

# des couleurs pour la complétion
# faites un kill -9 <tab><tab> pour voir :)
zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# Correction des commandes
setopt correctall

# Un petit prompt sympa
#autoload -U promptinit
#promptinit
#prompt pws

# Les alias marchent comme sous bash
alias ls='ls -G'
alias ll='ls -G -lah'
alias lll='ls -G -lah | less'

# marre de se faire corriger par zsh ;)
alias xs='cd'
alias sl='ls'

# mplayer en plein framme buffer ;)
alias mplayerfb='mplayer -vo fbdev -vf scale=1024:768'
# Un grep avec des couleurs :
export GREP_COLOR=31
alias grep='grep --color=auto'
alias xte='nohup xterm &' # xte lancera un xterm qui ne se fermera pas si on ferme le terminal

# Pareil pour les variables d'environement :
#export http_proxy="http://hostname:8080/"
#export HTTP_PROXY=$http_proxy
# un VRAI éditeur de texte ;)
export EDITOR=/usr/bin/emacs

source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
