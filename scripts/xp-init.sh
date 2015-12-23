#!/bin/bash

#Check if parameter exist
if [[ -n $1 ]]
then
	mkdir $1
	cd $1
fi

touch .compendium
mkdir backlog 2> /dev/null
mkdir "history" 2> /dev/null
