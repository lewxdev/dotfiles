#!/bin/zsh

# Help message
# this can definitely be done better, but idfk how to do that rn
if (( $@[(I)--help|-h] )); then
  echo "$(cat install-help.txt)" && exit
elif ! (( $@[(I)--help|-h|--brew|--brew-formulae|--brew-casks|--brew-cask-drivers|--vscode-extensions|--omz|--omz-plugins|--symlinks] )); then
  echo "unknown option\n\n$(cat install-help.txt)" && exit
fi

# Installation identifiers

local BREW_FORMULAE=(
  "android-platform-tools"
  "figlet"
  "imagemagick"
  "node"
  "nvm"
  "pnpm"
)

local BREW_CASKS=(
  "1password"
  "affinity-designer"
  "cleanmymac"
  "discord"
  "docker"
  "google-chrome"
  "google-drive"
  "hyper"
  "loopback"
  "notion"
  "replacicon"
  "shureplus-motiv"
  "slack"
  "spotify"
  "via"
  "visual-studio-code"
  "zoom"
)

local BREW_CASK_DRIVERS=(
  "canon-eos-webcam-utility"
  "logi-options-plus"
)

local VSCODE_EXTENSIONS=(
  "alexperronnet.spectrum-vscode-icons"
  "dbaeumer.vscode-eslint"
  "eamodio.gitlens"
  "esbenp.prettier-vscode"
  "figma.figma-vscode-extension"
  "github.vscode-pull-request-github"
  "icrawl.discord-vscode"
  "joelcrosby.one-dark-darker"
  "ms-vsliveshare.vsliveshare"
  "pflannery.vscode-versionlens"
  "rangav.vscode-thunder-client"
  "redhat.vscode-yaml"
  "ritwickdey.liveserver"
  "streetsidesoftware.code-spell-checker"
  "wallabyjs.quokka-vscode"
  "wix.vscode-import-cost"
  "yoavbls.pretty-ts-errors"
)

declare -rA INSTALL_URIS=(
  [homebrew]="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
  [omz]="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh"
  [zsh_syntax_highlighting]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
)

colorize() { echo $(./src/bin/pre $2 -c $1); }
input() { read -qs "?$(colorize blue dotfiles) $@ (y/N) "; }
output() { if [[ $# -gt 0 ]]; then echo -e "$(colorize blue dotfiles)" "$@"; else echo; fi; }

# Homebrew installation
# see: https://github.com/Homebrew/install/blob/master/README.md
if (( $@[(I)--brew] )) || [[ $# -eq 0 ]]; then
  output "Checking if Homebrew is installed..."
  which -s brew &>/dev/null

  if [[ $? != 0 ]]; then
    output "Homebrew installation couldn't be found. Attempting install..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL ${INSTALL_URIS[homebrew]})" && \
    brew update
  else
    output "Homebrew already installed. Attempting update..."
    brew update
  fi
  output
fi

# Homebrew formulae installation
if (( $@[(I)--brew-formulae] )) || [[ $# -eq 0 ]]; then
  output "Installing Homebrew formulae..."

  for formula in ${BREW_FORMULAE[@]}; do
    local prefix=$(colorize cyan $formula)

    if input $prefix "Homebrew formula will install or upgrade, proceed?"; then
      >&2 echo $REPLY
      if brew list $formula &>/dev/null; then
        output $prefix "Homebrew formula already installed. Attempting upgrade..."
        brew upgrade $formula
      else
        output $prefix "Installing Homebrew formula..."
        brew install $formula
      fi
    else
      >&2 echo $REPLY
    fi
  done
  output
fi

# Homebrew casks installation
if (( $@[(I)--brew-casks] )) || [[ $# -eq 0 ]]; then
  output "Installing Homebrew casks..."

  for cask in ${BREW_CASKS[@]}; do
    local prefix=$(colorize cyan $cask)

    if input $prefix "Homebrew cask will install or upgrade, proceed?"; then
      >&2 echo $REPLY
      if ! brew info $cask &>/dev/null; then
        output $prefix "Homebrew cask already installed. Attempting upgrade..."
        brew upgrade $cask
      else
        output $prefix "Installing Homebrew cask..."
        brew install --cask $cask
      fi
    else
      >&2 echo $REPLY
    fi
  done
  output
fi

# Homebrew cask drivers installation
if (( $@[(I)--brew-cask-drivers] )) || [[ $# -eq 0 ]]; then
  brew tap homebrew/cask-drivers
  output "Installing Homebrew cask-drivers..."

  for cask_driver in ${BREW_CASK_DRIVERS[@]}; do
    local prefix=$(colorize cyan $cask_driver)

    if input $prefix "Homebrew cask-driver will install or upgrade, proceed?"; then
      >&2 echo $REPLY
      if brew list $cask_driver &>/dev/null; then
        output $prefix "Homebrew cask-driver already installed. Attempting upgrade..."
        brew upgrade $cask_driver
      else
        output $prefix "Installing Homebrew cask-driver..."
        brew install $cask_driver
      fi
    else
      >&2 echo $REPLY
    fi
  done
  output
fi

# Visual Studio Code extensions installation
if (( $@[(I)--vscode-extensions] )) || [[ $# -eq 0 ]]; then
  output "Installing Visual Studio Code extensions..."

  # At this point, VS Code should have been installed by Homebrew
  # Extensions can be installed via the "code" command (made available here)
  alias code="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
  which -s code &>/dev/null

  if [[ $? != 0 ]]; then
    output "Couldn't find \"code\" command (is Visual Studio Code installed?)."
    output "Skipping extension installation."
  else
    for extension_id in ${VSCODE_EXTENSIONS[@]}; do
      local prefix=$(colorize cyan $extension_id)

      if input $prefix "Proceed with extension installation?"; then
        >&2 echo $REPLY
        if code --list-extensions | grep "$extension_id" &>/dev/null; then
          output $prefix "Extension already installed."
        else
          output $prefix "Attempting extension install..."
          code --install-extension $extension_id
        fi
      else
        >&2 echo $REPLY
      fi
    done
  fi
  output
fi

# Oh My Zsh installation
if (( $@[(I)--omz] )) || [[ $# -eq 0 ]]; then
  output "Checkiing if Oh My Zsh is installed..."

  if [[ -d $ZSH ]]; then
    output "Oh My Zsh is already installed. Attempting upgrade..."
    $ZSH/tools/upgrade.sh
  else
    output "Oh My Zsh installation couldn't be found. Attempting install..."
    sh -c "$(curl -fsSL ${INSTALL_URIS[omz]})"
  fi
  output
fi

# Oh My Zsh plugins installation
if (( $@[(I)--omz-plugins] )) || [[ $# -eq 0 ]]; then
  output "Attempting Oh My Zsh plugin installations..."

  # https://github.com/zsh-users/zsh-syntax-highlighting/
  local target_dir=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  if [[ -d $target_dir ]]; then
    output "Oh My Zsh plugin: \"zsh-syntax-highlighting\" is already installed."
  else
    git clone ${INSTALL_URIS[zsh_syntax_highlighting]} $target_dir
  fi
  output
fi

# Configuration files setup
if (( $@[(I)--symlinks] )) || [[ $# -eq 0 ]]; then
  output "Installing symlinks to configuration files..."

  for file in $(find . -type f ! \( -path "./.*" -o -path "./src/*" \)); do
    reference=$(echo "$(head -2 $file)" | grep -o "DEST:.*" | sed "s/DEST://")
    reference_path="${reference/\~/$HOME}"
    file_path="${file/\./$PWD}"

    if ! [[ -z "$reference" ]]; then
      output "Linking configuration file: $file -> $reference..."

      if [[ "$file_path" -ef "$reference_path" ]]; then
        output "Symlink to \"$file\" already exists."
      else
        ln -sf "$file_path" "$reference_path"
      fi
    fi
  done
  output
fi

for count in {29..0}; do
  echo -ne "$(colorize blue dotfiles) Process complete, refreshing... ($count)\033[0K\r"
  sleep 1
done

unset colorize
unset input
unset output

# Complete installation with the welcome screen :)
source ~/.zshrc
