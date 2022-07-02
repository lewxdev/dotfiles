#!/bin/zsh

# Opens a number of applications given a list of valid direcotry arguments
app () {
	for arg in $@; do
		if [[ $arg =~ .+.app$ ]] && ; then
			local result=$(exdir $arg)
			if [[ $result =~ ^Error:.+ ]]; then
				echo $result
				return 1
			else
				echo "Opening $result" && open $result ||
				echo "Error: something went wrong when trying to open that app."
			fi
		else
			echo "Error: invalid app $result"
			return 2
		fi
	done
	return 0
}
