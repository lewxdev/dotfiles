#!/bin/zsh

# `cd` into the assessments directory of a given quarter
kaq () {
	if [[ ! $# -le 1 ]] || [[ ! $# -gt 0 ]]; then
		echo "Error: provide a single quarter."
		return 1
	fi

	if [[ ${1:0:1} == "q" ]]; then
		if [[ $1 =~ ^q[1-4] ]]; then
			local assigned_dir=$1
		else
			echo "Error: invalid argument for quarter"
			return 2
		fi
	elif [[ $1 =~ [1-4] ]]; then
		local assigned_dir="q$1"
	else
		echo "Error: invalid argument for quarter"
		return 2
	fi

	local goto_dir=${DIR[KA]}/software\ engineering/$assigned_dir/assessments
	if [[ -e $goto_dir ]]; then
		echo "Working in 'ka/se/$assigned_dir'"
		cdls "$goto_dir"
		return 0
	else
		echo "Error: invalid argument for quarter" && return 2
	fi
}