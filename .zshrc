#!/usr/bin/env zsh

# env variables
export HISTFILE=~/.zsh_history
export HISTSIZE=2000
export SAVEHIST=$HISTSIZE
export GREP_COLOR=31
export EDITOR="code --wait" # visual studio code
export RLS_ROOT="$HOME/Documents/rls"

# brew
export HOMEBREW_CACHE=/tmp/mycache
export HOMEBREW_TEMP=/tmp/mytemp
mkdir -p /tmp/mytemp /tmp/mycache ~/Library/Caches/Homebrew

# openssl
export OPENSSL_INCLUDE_DIR=$(brew --prefix openssl)/include
export OPENSSL_LIB_DIR=$(brew --prefix openssl)/lib
export DEP_OPENSSL_INCLUDE=$(brew --prefix openssl)/include

# Rust
export CARGO_INCREMENTAL=1

# aliases
alias ls='exa'
alias ll='exa -la --git'
alias l='ll'
alias grep='rg'
alias gs="git log --oneline --decorate -8 2> /dev/null && echo; git status"
alias gc="git commit"
alias gp="git push"
alias ga="git add"

# cdpath
export CDPATH="$HOME/Documents"

# git config
git config --global core.editor "code --wait"
git config --global alias.ls 'log --oneline --decorate --graph -8'
git config --global alias.la 'log --oneline --decorate --graph --all'
git config --global alias.ll 'log --oneline --decorate --graph --all -16'

function swap_buffer {
	local tmp_buffer=$SWAP_BUFFER
	SWAP_BUFFER=$BUFFER
	BUFFER=$tmp_buffer
}

zle -N swap_buffer
bindkey '^B' swap_buffer
bindkey '^N' beep

# history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduceblanks

# my prompt
setopt PROMPT_SUBST
function git_branch {
	local branch=$(git name-rev $(git rev-parse --short HEAD 2> /dev/null) 2> /dev/null)
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

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
