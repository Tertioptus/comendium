#!/bin/bash


if [[ `pwd` =~ c:feature ]]
then
	POINTS_DIRS=()
	POINTS_DIRS+=(`ls points.*`)
	if [[ ! -z POINTS_DIRS ]]
	then
		POINTS=${POINTS_DIRS[0]:2}
  		LEVEL=99-$POINTS 
	else
	fi
<<COMMENT1
else
	if dependets
	then
		LEVEL= lowest level among dependents - number of dependents

	else	#Orphan the story
    	#xp-set s:0
    	LEVEL=00
	fi
COMMENT1
fi

echo `pwd`
echo $LEVEL
#xp-set l:$LEVEL
