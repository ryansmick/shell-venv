SHELL_VENV_INSTALL_POINT="/usr/local/bin"

declare -a SHELL_VENV_COMMAND_NAMES=()

# Find all directories in the shell-venv-commands directory and source key files in those directories
for command_name in ${SHELL_VENV_COMMAND_NAMES[@]}; do
	command_path=${SHELL_VENV_INSTALL_POINT}/shell-venv-commands/${command_name}
	source $command_path/$command_name.sh
	source $command_path/${command_name}_completion.sh
done

# Display help message
function shell-venv-help {
	echo "Usage: shell-venv [COMMAND] [OPTIONS] [ARGUMENTS]
	Available commands: ${SHELL_VENV_COMMAND_NAMES[@]}"
}

# Determine if an array contains the given element
function contains {
	for list_value in "${@:2}"; do
		if [ $list_value == $1 ]; then
			return 0
		fi
	done

	return 1
}

# Create the shell-venv function
function shell-venv {
	if [ $# -lt 1 ]; then
		shell-venv-help
		return 1
	fi

	contains $1 ${SHELL_VENV_COMMAND_NAMES[@]}
	if [ $? -ne 0 ]; then
		echo "Error: \"$1\" is not a valid command"
		return 1
	fi
}

# Tab completion for shell-venv command
function _shell-venv-completions {
	if [ $COMP_CWORD -ne 1 ]; then
		return 0
	fi

	COMPREPLY=($(compgen -W "${SHELL_VENV_COMMAND_NAMES[*]}" "${COMP_WORDS[1]}"))
}

# Set tab completion script
complete -F _shell-venv-completions shell-venv
