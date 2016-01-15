function __fish_command_not_found_handler --on-event fish_command_not_found
	echo "fish: Hoooo, nope! '$argv' doesn't exist !" >&2
end
