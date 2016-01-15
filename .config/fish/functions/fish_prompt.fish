function fish_prompt --description 'Write out the prompt'
	# keep last status en memory
	set -l last_status
	set last_status $status

	# Just calculate this once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

	set -l color_cwd
	set -l suffix
	switch $USER
	case root toor
		if set -q fish_color_cwd_root
			set color_cwd $fish_color_cwd_root
		else
			set color_cwd $fish_color_cwd
		end
		set suffix '#'
	case '*'
		set color_cwd $fish_color_cwd
		set suffix '>'
	end

	# last bad status
	if test $last_status -ne 0
		echo -n -s (set_color red) "$last_status "
	end

	# SHLVL if greater than 1
	if test $SHLVL -gt 1
		echo -n -s (set_color white) "+ "
	end

	# number of jobs
	if not jobs 2> /dev/null > /dev/null
		# echo " [if] status: $status "
		echo -n -s (set_color white) '[*] '
	else
		# echo " [else] status: $status "
	end

	# hostname, git branch/dirty, cwd compressed
	echo -n -s (set_color blue) "$__fish_prompt_hostname" (set_color white) ': '
	echo -n -s (set_color yellow) (__fish_git_prompt "%s ") (set_color white)
	echo -n -s (set_color $color_cwd) (prompt_pwd) (set_color normal) "$suffix "
end
