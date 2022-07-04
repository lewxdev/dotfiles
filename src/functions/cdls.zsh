#!/bin/zsh

# Performs a `cd` and `ls` in sequence on the given directory
# (with optional arguments to the `ls` command).
cdls() {
	local output=$(python3 ${DIR[SHS]}/cdls.py "$@")

	if [[ $? -eq 0 ]]; then
		if [[ $output =~ "^cd " ]]; then
			eval $output
		elif [[ $output =~ "^usage:" ]]; then
			printf $output
		fi
	fi
}
