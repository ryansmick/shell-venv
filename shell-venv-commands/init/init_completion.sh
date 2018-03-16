# Tab completion for shell-venv list command
function _shell-venv-init-completions {
	if [ $COMP_CWORD -lt 2 ]; then
		return 0
	fi

	if [ $COMP_WORDS[1] -ne init ]; then
		return 0
	fi
}

# Set tab completion script
complete -F _shell-venv-init-completions shell-venv

