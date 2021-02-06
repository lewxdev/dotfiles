# DEST: ~/.zshrc

# Environment Variables
# Directories
declare -xrA DIR=(
	# Applications
	[APPS]=/Applications
	[PWA]=~/Applications/Chrome\ Apps.localized

	# Documents
	[DOCS]=~/Documents
	[DLS]=~/Downloads
	[DRIVE]=~/Google\ Drive

	# Minecraft
	[MC]=~/Library/Application\ Support/minecraft
	[MCS]=~/Library/Application\ Support/minecraft_release
	[MCC]=~/Library/Application\ Support/minecraft_snapshots

	# Developer Modules
	[DEV]=~/Developer
	[DOTF]=~/Developer/dotfiles
	[SHM]=~/Developer/dotfiles/shell
	[SHX]=~/Developer/dotfiles/shell/exec
)

# Globals
export PATH="${DIR[SHX]}:/usr/local/sbin:$PATH"
export EDITOR=/usr/bin/nano
export VISUAL=/usr/local/bin/code

export PYENV=~/.pyenv
export ZSH=~/.oh-my-zsh

source $PYENV/config.sh
source $ZSH/preferences.sh

for module in $(find ${DIR[SHM]} -name "*.sh"); do
	source $module
done

# Syntax Highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-syntax-highlighting/highlight-styles.sh