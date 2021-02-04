#!/bin/zsh

# initializes a new django project with optional personal preferences
dj-init () {
	local project_name=${1:-config}
	if [[ ! -e $PWD/$project_name ]]; then
		django-admin startproject $project_name . &&
		echo "Completed. startproject '$project_name'."
	else
		echo "Error: directory with name '$project_name' already exists."
	fi

	if [[ ! -e $PWD/templates ]]; then
		mkdir templates &&
		echo "Completed. created templates directory."
	else
		echo "Error: directory with name 'templates' already exists."
	fi

	return 0
}