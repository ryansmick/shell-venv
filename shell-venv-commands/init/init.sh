# File to control the init command

# Create a new virtual environment and set up files
function shell-venv-init {

	if [ $# -lt 1 ]; then
		shell-venv-init-help
		return 1
	fi

	# Ensure virtual environment name is only one word
	case $1 in 
		*\ * )
			echo "Error: virtual environment names must not contain whitespace"
			return 1
			;;
		*)
			;;
	esac

	# Determine if virtual environment already exists
	SHELL_VENV_NEW_ENV=${SHELL_VENV_HOME}/${1}
	if [ -d "$SHELL_VENV_NEW_ENV" ]; then
		echo "Error: virtual env \"$1\" already exists"
		return 1
	fi

	# Create virtual env directory
	echo "Creating environment directory..."
	mkdir $SHELL_VENV_NEW_ENV

	# Create bin and lib directories
	echo "Creating bin directory..."
	mkdir ${SHELL_VENV_NEW_ENV}/bin
	mkdir ${SHELL_VENV_NEW_ENV}/lib
	

	# Create env variable scripts
	echo "Creating scripts..."
	touch ${SHELL_VENV_NEW_ENV}/activate_env.sh
	touch ${SHELL_VENV_NEW_ENV}/deactivate_env.sh

	# Create activation and deactivation scripts
	touch ${SHELL_VENV_NEW_ENV}/preactivate.sh
	touch ${SHELL_VENV_NEW_ENV}/postactivate.sh
	touch ${SHELL_VENV_NEW_ENV}/predeactivate.sh
	touch ${SHELL_VENV_NEW_ENV}/postdeactivate.sh

	echo "Initialization complete!"
}

function shell-venv-init-help {
	echo "Usage: shell-venv init [NAME]"
	echo "NAME: The name of the virtual environment"
}
