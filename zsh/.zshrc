# DEST: ~/.zshrc

# Environment Variables: Constants
declare -A DIR
DIR[DEV]=$HOME/Developer
DIR[DOTF]=${DIR[DEV]}/Projects/dotfiles
DIR[SH]=${DIR[DOTF]}/shell
DIR[SHEXEC]=${DIR[SH]}/exec
DIR[APPS]=/Applications

export DIR
export PYENV=$HOME/.pyenv
export ZSH=$HOME/.oh-my-zsh
export PATH="${DIR[SHEXEC]}:/usr/local/sbin:$PATH"

# Sources
source $ZSH/preferences.sh
source $PYENV/config.sh

for module in $(find ${DIR[SH]} -name "*.sh"); do
	source $module
done

# Syntax Highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-syntax-highlighting/highlight-styles.sh