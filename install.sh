# Copy the pertinent scripts and commands to the venv installation point
SHELL_VENV_INSTALL_POINT="/usr/local/bin"

PATH_TO_SCRIPT="`dirname \"$0\"`"
echo "Copying scripts to $SHELL_VENV_INSTALL_POINT..."

cp $PATH_TO_SCRIPT/shell-venv.sh $SHELL_VENV_INSTALL_POINT/shell-venv.sh > /dev/null
cp -r $PATH_TO_SCRIPT/shell-venv-commands $SHELL_VENV_INSTALL_POINT/ > /dev/null

echo "Installation completed!"
