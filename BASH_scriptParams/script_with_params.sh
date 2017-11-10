#!/bin/bash

read_arguments()
{
	echo "Reading params..."
	for arg in $@; do
		if [[ $arg =~ ^- ]]; then
			for i in $(seq 0 $(expr length "${arg}")) ; do
				case "${arg:$i:1}" in
				"d")
					echo "letter d found"
					;;
				*);;
				esac
			done
		else
			echo "simple param $arg"
		fi
	done
}

#MAIN FUNCTION
script_with_arguments()
{
	echo "Executing script with arguments..."
	read_arguments "$@"
}

script_with_arguments $@