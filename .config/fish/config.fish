# ENVIRONNEMENT
set -x PATH $HOME/.brew/bin $PATH
set -x HOMEBREW_CACHE $HOME/Library/Caches/Homebrew/Formula

# ALIASES

# git
abbr --add gp="git push"
abbr --add gc="git commit -am"
abbr --add gs="git status"
abbr --add ga="git add"

# ls
abbr --add l="ls -la"
abbr --add ll="ls -la"

# sublime text
abbr --add st="sublime_text"

function __fish_default_command_not_found_handler
	echo "fish: Hoooo, nope! '$argv' doesn't exist !" >&2
end

# function __fish_default_command_not_found_handler
#     echo "fish: Unknown command '$argv'" >&2
# end

#
# Hook up the default as the principal command_not_found handler
# in case we are not interactive
#
status -i; or function __fish_command_not_found_handler --on-event fish_command_not_found
    __fish_default_command_not_found_handler $argv
end
