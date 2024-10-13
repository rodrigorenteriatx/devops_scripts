#!/usr/bin/env bash

prompt_for_input(){
	read -r -p "$1 [$2]: " input
	echo "${input:-$2}" # if input is null (we just press enter, no value, then it will be $2
	# the echo, is STDOUT, that later gets capture in the $(), meaning the echo RETURNS the value to be used in AGE
}


age=$(prompt_for_input "Enter the age" "21")

if [ $age -ge 21 ]; then
	echo "You're $age , We can drink!!"
else
	echo "You are TOO YOUNG"
fi
