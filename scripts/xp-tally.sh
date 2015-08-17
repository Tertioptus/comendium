#!/bin/bash


if [[ `pwd` =~ c:feature ]]
then
	POINTS_DIRS+=(`ls points.*`)
	if [ -n POINTS_DIRS ]
	then
		POINTS=${POINTS_DIRS[0]:7}
  		LEVEL=$((99-$POINTS)) 
	fi
else
	links=(`ls dependent.*`)
	for l in $links
	do
		echo `readlink $l`
	done
	if [[ -n $links  ]] 
	then
		echo "LEVEL= lowest level among dependents - number of dependents"
	else	#Orphan the story
    		echo "xp-set s:0"
    		LEVEL=00
	fi
fi

echo `pwd`
echo $LEVEL
#xp-set l:$LEVEL
