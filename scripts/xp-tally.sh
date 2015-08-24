#!/bin/bash
set -x

##### GET LEVEL #####
if [[ `pwd` =~ c:feature ]]
then
	POINTS_DIRS+=(`ls points.*`)
	if [ -n POINTS_DIRS ]
	then
		POINTS=${POINTS_DIRS[0]:7}
  		LEVEL=$((100-$POINTS)) 
	fi
else
	links=(`ls dependent.*`)
	MAX=99
	for l in $links
	do
		realPath=`readlink ${l%@}`
		left=${realPath%|i:*}
		echo left: $left
		right=${left#*|l:}
		echo right: $right
		if [[ 99 -gt $right ]] 
		then
			MAX=$right
		fi
	done
	MAX=$(($MAX-1))
	echo Max: $MAX
	if [[ -n $links ]] 
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
