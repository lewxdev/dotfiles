#!/bin/zsh

# resets existing migrations and database to rollback to an initial state
dj-resetdb () {
	if (( $# == 1 )); then
		case $1 in
			-su | --superuser )
				local su=true
				;;
			* )
				echo "Error: invalid argument provided."
				return 1
		esac
	elif (( $# > 1 )); then
		echo "Error: number of arguments must not be greater than 1"
		return 2
	else
		local su=false
	fi

	find . -path '*/migrations/*.py' -not -name '__init__.py' -delete &&
	find . -path '*/migrations/*.pyc' -delete &&
	rm -rf db.sqlite3 &&
	python manage.py makemigrations && python manage.py migrate &&
	echo "Database successfully reset."

	if [[ $su ]]; then
		python manage.py createsuperuser
	fi
	return 0
}