#!/usr/bin/env zsh

local directory=~/projects/dotfiles
local brewfile=$directory/Brewfile
local source=$directory/source
local repository="https://github.com/lewxdev/dotfiles.git"

function usage() {
	test -n "$1" && echo unknown option: $1
	echo "
dotfiles install (@lewxdev)
usage: [NO_INSTALL=1] [NO_LINK=1] install.zsh [options]
  NO_INSTALL=1  skip installing dependencies
  NO_LINK=1     skip linking configuration files
  -h, --help    show this message
"
	exit
}

while test $# -gt 0; do
	case $1 in
		-h|--help) usage ;;
		*) usage $1 ;;
	esac
done

echo checking installs ...

# clone repository
if ! test -d $directory; then
	echo cloning repository to \"$directory\" ...
	git clone --quiet $repository $directory
fi

# install homebrew
# see: https://github.com/Homebrew/install/blob/master/README.md
if ! command -v brew &> /dev/null; then
	echo installing homebrew ...
	bash -c "$(curl -fsSL https://raw.github.com/Homebrew/install/HEAD/install.sh)"
	eval "$(brew shellenv)"
fi

# install gum
# see: https://github.com/charmbracelet/gum/blob/main/README.md#installation
if ! command -v gum &> /dev/null; then
	echo installing gum ...
	brew install --quiet gum
fi

# install omz
# see: https://ohmyz.sh/#install
if ! test -d $ZSH; then
	echo installing omz ...
	sh -c "$(curl -fsSL https://install.ohmyz.sh)" "" --unattended --keep-zshrc
fi

# install zsh plugins
local zsh_plugin_root=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins
# see: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
local plugin_directory=$zsh_plugin_root/zsh-syntax-highlighting
if ! test -d $plugin_directory; then
	echo installing zsh-syntax-highlighting ...
	git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git $plugin_directory
else
	echo updating zsh-syntax-highlighting ...
	git -C $plugin_directory pull --quiet
fi

echo ready!

# install dependencies
if test -z "${NO_INSTALL-}"; then
	# currently there is no documented environment variable for skipping vscode extensions
	# see: https://docs.brew.sh/Manpage#bundle-subcommand
	# todo: open an issue on homebrew-bundle
	echo note: vscode extensions installs cannot be skipped

	function get_skipped() {
		echo getting $1 ... >&2
		local dependencies=$(brew bundle list --file="$brewfile" --$1)
		test -z $dependencies && return

		local header=--header="$(gum style --bold "choose $1 to install")"
		local selected=--selected="$(echo $dependencies | tr "\n" ",")"
		local choices=$(echo $dependencies | gum choose --no-limit $header $selected)
		echo $(comm -13 <(echo $choices) <(echo $dependencies))
	}

	HOMEBREW_BUNDLE_BREW_SKIP=$(get_skipped brews)\
	HOMEBREW_BUNDLE_CASK_SKIP=$(get_skipped casks)\
	HOMEBREW_BUNDLE_MAS_SKIP=$(get_skipped mas)\
	HOMEBREW_BUNDLE_TAP_SKIP=$(get_skipped taps)\
		brew bundle --quiet install --file="$brewfile" --no-lock
fi

# link configuration files
if test -z "${NO_LINK-}"; then
	echo linking configuration files in ${sources/$HOME/\~} ...
	for source in $(find $sources -type f); do
		local source_name=${source/$sources\/}
		local target_name=$(echo "$(head -2 $source)" | grep -o "DEST:.*" | sed "s/DEST://")
		local target=${target_name/\~/$HOME}
		test -z $source || test -z $target && continue

		echo $source_name → $target_name ...
		ln -sf $source $target
	done
fi

# done
echo process complete. reloading in 10s ...
sleep 10
exec zsh
