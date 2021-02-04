# DEST: ~/.zshrc

# Environment Variables: Constants
declare -A DIR
DIR[DEV]=$HOME/Developer
DIR[SH]=${DIR[DEV]}/Resources/shell
DIR[SHMODS]=${DIR[SH]}/modules
DIR[SHEXEC]=${DIR[SHMODS]}/exec
DIR[APPS]=/Applications

export DIR
export PYENV=$HOME/.pyenv
export ZSH=${DIR[SH]}/omz
export PATH="${DIR[SHEXEC]}:/usr/local/sbin:$PATH"

# Sources
source $ZSH/preferences.sh
source $PYENV/config.sh

for module in $(find ${DIR[SHMODS]} -name "*.sh"); do
	source $module
done

# Syntax Highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-syntax-highlighting/highlight-styles.sh