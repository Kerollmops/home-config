#!/usr/bin/env zsh
#   _________  _   _ ____   ____
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |
# _ / /_ ___) |  _  |  _ <| |___
#(_)____|____/|_| |_|_| \_\\____|
#

# env variables
export HISTFILE=~/.zsh_history
export HISTSIZE=2000
export SAVEHIST=$HISTSIZE
export GREP_COLOR=31
export PATH="$HOME/.brew/bin:$PATH" # home brew
export PATH="$HOME/.cargo/bin:$PATH" # cargo binaries
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export EDITOR="code --wait" # visual studio code

# brew
export HOMEBREW_CACHE=/tmp/mycache
export HOMEBREW_TEMP=/tmp/mytemp
mkdir -p /tmp/mytemp /tmp/mycache ~/Library/Caches/Homebrew

# aliases
alias ls='ls -G'
alias ll='ls -laG -hAlp'
alias l='ll'
alias grep='rg'
alias gs="git ls 2> /dev/null && echo; git status"
alias gc="git commit"
alias gp="git push"
alias ga="git add"

# git config
git config --global core.editor "code --wait"
git config --global alias.ls 'log --oneline --decorate --graph -8'
git config --global alias.la 'log --oneline --decorate --graph --all'
git config --global alias.ll 'log --oneline --decorate --graph --all -16'

# history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduceblanks

# my prompt
setopt PROMPT_SUBST
function git_branch {
	local branch=$(git symbolic-ref -q --short HEAD 2> /dev/null)
	if [[ ! -z $branch ]] then
		echo $branch" "
	fi
}
function get_pwd {
	echo "%20<...<%c%<<"
}
function need_commit {
	if [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] then
		echo "%F{red};%f"
	else
		echo "%F{white};%f"
	fi
}
export PROMPT='%F{red}%(?..%? )'\
'%F{white}%B%(2L.+ .)%(1j.[%j] .)'\
'%F{cyan}%m:%f '\
'%F{green}$(git_branch)'\
'%F{yellow}$(get_pwd)%f'\
'$(need_commit) %b'

# corrupt_history
function corrupt_history() {

	mv ~/.zsh_history ~/.zsh_history_bad
	strings ~/.zsh_history_bad > ~/.zsh_history
	fc -R ~/.zsh_history
	rm ~/.zsh_history_bad
}

# fn + delete
bindkey '\e[3~' delete-char
# binding key for history
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# edit command in emacs
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^[e" edit-command-line

# move word
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

# bindkey "[^?" backward-delete-word
# bindkey "^?[C" forward-delete-word

# Completion
# https://github.com/Homebrew/homebrew-completions
fpath=($HOME/completion $HOME/.brew/share/zsh/site-functions $HOME/.brew/share/zsh-completions $fpath)
autoload -U compinit
compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

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

# live command color
source ~/zsh-syntax-highlighting.zsh

# added by travis gem
[ -f /Users/crenault/.travis/travis.sh ] && source /Users/crenault/.travis/travis.sh
