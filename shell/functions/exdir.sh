#!/bin/zsh

# Returns a directory from shorthand notation
exdir () {
	if [[ ! $# -le 1 ]] || [[ ! $# -gt 0 ]]; then
		echo "Error: only provide a single directory."
		return 1
	fi

	if [[ ${1:0:2} == ".." ]]; then
		echo "Error: only relative directories currently supported."
		return 2
	elif [[ $1 =~ ^~.+ ]]; then
		local dir_=${1/#~/$HOME}
	elif [[ $1 =~ ^\..+ ]]; then
		local dir_=${1/#./$PWD}
	else
		local dir_=$1
	fi

	if [[ ! -e $dir_ ]]; then
		echo "Error: directory does not exist."
		return 3
	fi

	echo $dir_
	return 0
}
