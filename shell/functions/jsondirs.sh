#!/bin/zsh

# Returns a JSON string representing an array of the dirs in the pwd
jsondirs () {
	local list_container="[X]"
	local list_items=""

	for entry in $PWD/*; do
		if [[ -d $entry ]]; then
			list_items="$list_items, \"${entry##$PWD/}\""
		fi
	done

	echo ${list_container/"X"/${list_items[3,${#list_items}]}}
}