# List command to display all available virtual environments

# Function to list available virtual environments
function shell-venv-list {
	ls -d ${SHELL_VENV_HOME}/* | xargs -d '\n' -L 1 basename | sort
}

