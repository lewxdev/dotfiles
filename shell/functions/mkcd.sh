#!/bin/zsh

# Performs a `mkdir` and `cdls` in sequence on a given directory
mkcd () {
	if [[ ! $# -le 1 ]] || [[ ! $# -gt 0 ]]; then
		echo "Error: create a single directory to move to."
		return 1
	fi

	mkdir $1 && cdls $PWD/$1
}
