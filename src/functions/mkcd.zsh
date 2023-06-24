#!/bin/zsh

# Performs a `mkdir` and `cd` in sequence on the given directory
# (with optional arguments to the `mkdir` command).
mkcd() {
  local output=$(python3 ${DIR[SHS]}/mkcd.py "$@")

  if [[ $? -eq 0 ]]; then
    if [[ $output =~ "^mkdir " ]]; then
      eval $output
    elif [[ $output =~ "^usage:" ]]; then
      printf $output
    fi
  fi
}
