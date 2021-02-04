#!/bin/zsh

# Performs a `cd` and `ls` in sequence on a given directory
cdls () {
	if [[ ! $# -le 1 ]] || [[ ! $# -gt 0 ]]; then
		echo "Error: move into a single directory."
		return 1
	fi

	local result=$(exdir $1)
	if [[ $result =~ ^Error:.+ ]]; then
		echo $result
		return 2
	else
		cd $result && ls
		return 0
	fi
}