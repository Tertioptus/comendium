#!/bin/bash

HOME=`pwd`

##### GET LEVEL #####
if [[ $HOME =~ c:feature ]]
then
	POINTS_DIRS+=(`printf '%s\n' points.*`)
	if [ -n POINTS_DIRS ]
	then
		POINTS=${POINTS_DIRS[0]:7}
  		LEVEL=$((100-$POINTS)) 
	fi
else
	links=(`printf '%s\n' dependent.*`)
	MAX=99
	MAX=$(($MAX-1))
	echo Max: $MAX
	if [[ -n $links ]] 
	then
		for l in $links
		do
			realPath=`readlink ${l%@}`
			left=${realPath%|i:*}
			echo left: $left
			right=${left#*|l:}
			echo right: $right
			if [[ 99 -gt $right ]] 
			then
				LEVEL=$right
			fi
		done
	else	#Orphan the story
			#xp set s:0
    		LEVEL=00
	fi
fi

echo LEVEL: $LEVEL
#xp set l:$LEVEL
HOME=`pwd`

dependencies=(`printf '%s\n' dependency.*`)
for dependency in $dependencies
do
	dependencyId=${dependency#*dependency.}
	echo dependencyId: $dependencyId
	#xp depend ${dependencyId%@}	
	realPath=`readlink dependency.${dependencyId%@}`
	echo dependency real path: $realPath
	#cd -P "$realPath"
	#xp-tally
done

echo $HOME
#cd "$HOME"
