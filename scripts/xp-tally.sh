#!/bin/bash


if [[ `pwd` =~ c:feature ]]
then
  LEVEL=99 - feature points

else
	if dependets
	then
		LEVEL= lowest level among dependents - number of dependents

	else	#Orphan the story
    	xp-set s:0
    	LEVEL=00
	fi
fi

xp-set l:$LEVEL
