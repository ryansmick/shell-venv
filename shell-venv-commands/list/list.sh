# List command to display all available virtual environments

# Function to list available virtual environments
function shell-venv-list {
	if  ls -d ${SHELL_VENV_HOME}/* >/dev/null 2>&1 ; then
		ls -d ${SHELL_VENV_HOME}/* 2>/dev/null | xargs -d '\n' -L 1 basename | sort
	fi
}

