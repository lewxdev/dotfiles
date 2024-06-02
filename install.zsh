#!/usr/bin/env zsh

# get the latest release from GitHub
echo "downloading the dotfiles CLI..."
curl -fsSL -o /usr/local/bin/dotfiles https://github.com/lewxdev/dotfiles/releases/download/latest/dotfiles

# make the file executable
echo "completing installation..."
chmod +x /usr/local/bin/dotfiles

if ! test -x /usr/local/bin/dotfiles; then
  echo "error: dotfiles is not installed, try again or install manually"
  exit 1
fi

# post installation message
echo "
     __     __  ____ __
 ___/ /__  / /_/ _(_) /__ ___
/ _  / _ \/ __/ _/ / / -_|_-<
\_,_/\___/\__/_//_/_/\__/___/ v$(dotfiles --version)

successfully installed the dotfiles CLI 🎉

next steps:
  1. run 'dotfiles install'
  2. edit '~/projects/dotfiles'

see 'dotfiles --help' for more"
