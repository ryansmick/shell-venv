# Tab completion for shell-venv list command
function _shell-venv-list-completions {
	if [ $COMP_CWORD -lt 2 ]; then
		return 0
	fi

	if [ $COMP_WORDS[1] -ne list ]; then
		return 0
	fi
}

# Set tab completion script
complete -F _shell-venv-list-completions shell-venv

