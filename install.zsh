#!/bin/zsh

# @lewxdev dotfiles: Installation Script (v1.0)
# --------------------------------------------------------------
# executable zsh shell script that initializes a new macOS
# machine for development with a complete set of preferred
# configurations and application installations

# Installation identifiers...

local BREW_FORMULAE=(
	"android-platform-tools"
	"figlet"
)

local BREW_CASKS=(
	"cleanmymac"
	"google-chrome"
	"hyper"
	"replacicon"
	"shureplus-motiv"
	"slack"
	"spotify"
	"vanilla"
	"visual-studio-code"
	"zoom"
)

local BREW_CASK_DRIVERS=(
	"canon-eos-webcam-utility"
	"logi-options-plus"
)

local VSCODE_EXTENSIONS=(
	"alexperronnet.spectrum-vscode-icons"
	"EditorConfig.EditorConfig"
	"esbenp.prettier-vscode"
	"JoelCrosby.one-dark-darker"
	"ritwickdey.LiveServer"
	"streetsidesoftware.code-spell-checker"
	"wix.vscode-import-cost"
)

# Additional installation constants...

declare -rA INSTALL_URIS=(
	[homebrew]="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
	[omz]="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
	[zsh_syntax_highlighting]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
)

# Provides a formatted indicator for commands run by this script
alias output-prefix=./shell/exec/output-prefix
local prefix=$(output-prefix "dotfiles-install" 34)
alias output='f(){ if [[ $# -gt 0 ]]; then echo "$prefix" "$@"; else echo; fi; unset -f f; }; f'

# TODO: Implement argument validation

# Homebrew installation...

# This syntax pattern checks if none or an identifying argument,
# "--brew" in this case, was passed to the script
if (( $@[(I)--brew] )) || [[ $# -eq 0 ]]; then
	output "Checking if Homebrew is installed..."

	which -s brew &>/dev/null
	if [[ $? != 0 ]]; then
		output "Homebrew installation couldn't be found. Attempting install..."
		/bin/bash -c "$(curl -fsSL ${INSTALL_URIS[homebrew]})"
	else
		output "Homebrew already installed. Attempting update..."
		brew update
	fi
	output
fi

# Homebrew formulae installation...

if (( $@[(I)--brew-formulae] )) || [[ $# -eq 0 ]]; then
	output "Installing Homebrew formulae..."

	for formula in ${BREW_FORMULAE[@]}; do
		if brew list $formula &>/dev/null; then
			output "Homebrew formula \"$formula\" already installed. Attempting upgrade..."
			brew upgrade $formula
		else
			output "Installing Homebrew formula \"$formula\"..."
			brew install $formula
		fi
		output
	done
fi

# Homebrew casks installation...

if (( $@[(I)--brew-casks] )) || [[ $# -eq 0 ]]; then
	output "Installing Homebrew casks..."

	for cask in ${BREW_CASKS[@]}; do
		if ! brew info $cask &>/dev/null; then
			output "Homebrew cask \"$cask\" already installed. Attempting upgrade..."
			brew upgrade $cask
		else
			output "Installing Homebrew cask \"$cask\"..."
			brew install --cask $cask
		fi
		output
	done
fi

# Homebrew cask drivers installation...

if (( $@[(I)--brew-cask-drivers] )) || [[ $# -eq 0 ]]; then
	brew tap homebrew/cask-drivers
	output "Installing Homebrew cask-drivers..."

	for cask_driver in ${BREW_CASK_DRIVERS[@]}; do
		if brew list $cask_driver &>/dev/null; then
			output "Homebrew cask-driver \"$cask_driver\" already installed. Attempting upgrade..."
			brew upgrade $cask_driver
		else
			output "Installing Homebrew cask-driver \"$cask_driver\"..."
			brew install $cask_driver
		fi
		output
	done
fi

# Visual Studio Code extensions installation...

if (( $@[(I)--vscode-extensions] )) || [[ $# -eq 0 ]]; then
	# At this point, VS Code should have been installed by
	# homebrew. Extensions can be installed via the "code"
	# command (made available here)
	PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

	which -s code &>/dev/null
	if [[ $? != 0 ]]; then
		output "Couldn't find \"code\" in PATH (is Visual Studio Code installed?)."
		output "Skipping extension installation."
		output
	else
		output "Installing Visual Studio Code extensions..."

		for identifier in ${VSCODE_EXTENSIONS[@]}; do
			if code --list-extensions | grep "$identifier" &>/dev/null; then
				output "Extension \"$identifier\" already installed."
			else
				output "Attempting extension install for \"$identifier\"..."
				code --install-extension $identifier
				output
			fi
		done
	fi
fi

# oh-my-zsh installation...

if (( $@[(I)--omz] )) || [[ $# -eq 0 ]]; then
	output "Checkiing if oh-my-zsh is installed..."

	if [[ -d $ZSH ]]; then
		output "oh-my-zsh is already installed. Attempting upgrade..."
		$ZSH/tools/upgrade.sh
	else
		output "oh-my-zsh installation couldn't be found. Attempting install..."
		sh -c "$(curl -fsSL ${INSTALL_URIS[omz]})"
	fi
	output
fi

# oh-my-zsh plugins installation...

if (( $@[(I)--omz-plugins] )) || [[ $# -eq 0 ]]; then
	output "Attempting oh-my-zsh plugin installations..."

	# https://github.com/zsh-users/zsh-syntax-highlighting/
	local target_dir=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	if [[ -d $target_dir ]]; then
		output "oh-my-zsh plugin: \"zsh-syntax-highlighting\" is already installed."
	else
		git clone ${INSTALL_URIS[zsh_syntax_highlighting]} $target_dir
	fi
	output
fi

# Configuration files setup...
# TODO: Implement automatic pushes for related file changes

if (( $@[(I)--links] )) || [[ $# -eq 0 ]]; then
	output "Installing symlinks to configuration files..."

	for file in $(find . -type f ! \( -path "./.*" -o -path "./shell/*" \)); do
		designator=$(head -1 $file)

		if [[ $designator =~ "^.+DEST:.+$" ]]; then
			reference=${designator#*DEST:}
			output "Linking configuration file: $file -> $reference..."

			reference_path="${reference/\~/$HOME}"
			file_path="${file/\./$PWD}"

			if [[ "$file_path" -ef "$reference_path" ]]; then
				output "Symlink to \"$file\" already exists."
			else
				ln -sf "$file_path" "$reference_path"
			fi
			output
		fi
	done
fi

# Complete installation with the welcome screen :)
# source ~/.zshrc