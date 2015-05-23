setopt PROMPT_SUBST

# git informations

function current_git_branch {

	 echo $(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3)
}

# current directory
function current_pwd {

	 echo "%20<...<%c%<<"
}

# get current pwd depth
function current_pwd_depth {

	  ret=$(echo $(grep -o "/" <<< `pwd` | wc -l))
	  if (( ${#$(pwd)} == 1 )); then
	     echo "0"; return
	  fi
	  echo $ret
}

export PROMPT='%K{white}%F{red}%(?..(%?%))'\
'%K{black}%F{white}%B%(2L.+.)%(1j.[%j].)'\
'%K{yellow}%F{black}%n%F{white}'\
'%K{green}%F{white}$(current_git_branch)'\
'%K{black}%F{yellow} $(current_pwd) '\
'%f%k%b'\
'$(current_pwd_depth)%# '
