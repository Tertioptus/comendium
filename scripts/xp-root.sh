#!/bin/bash

function findRoot() {
	local directory=$PWD
	while [[ -d "$directory" ]] 
	do
		if [[ -e "${directory}/$1" ]]
		then 
			echo $directory	
			
			break
		fi
			
		directory=${directory%/*}	
	done
}

COMPENDIUM_ROOT=$(findRoot ".compendium")

if [[ -z $COMPENDIUM_ROOT ]]
then	
	GIT_ROOT=`git rev-parse --show-cdup`
	COMPENDIUM_ROOT=${GIT_ROOT}compendium
fi

echo $COMPENDIUM_ROOT
