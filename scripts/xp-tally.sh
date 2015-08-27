#!/bin/bash

function run (){
	local ORIGINAL_STORY_HOME_DIRECTORY=`pwd`

	##### GET LEVEL #####
	if [[ $ORIGINAL_STORY_HOME_DIRECTORY =~ c:feature ]]
	then
		POINTS_DIRS+=(`printf '%s\n' points.*`)
		if [ -n POINTS_DIRS ]
		then
			POINTS=${POINTS_DIRS[0]:7}
			LEVEL=$((100-$POINTS))
		else
			echo Please set points for this feature.
		fi
	else
		links=(`printf '%s\n' dependent.*`)
		MIN=99
		COUNT=0
		echo Max: $MIN
		if [[ -n $links ]] 
		then
			for l in ${links[@]}
			do
				if [ -h "$l" ]
				then
					realPath=`readlink ${l%@}`
					left=${realPath%|i:*}
					echo left: $left
					right=${left#*|l:}
					echo right: $right
					if [[ $MIN -gt $right ]] 
					then
						MIN=$right
					fi
					COUNT=$(($COUNT+1))
				fi
			done
			LEVEL=$(($MIN-($COUNT-1)))
		else	#Orphan the story
			xp set s:0
			LEVEL=00
		fi
	fi
	echo LEVEL: $LEVEL
	xp set l:$LEVEL
	local ORIGINAL_STORY_HOME_DIRECTORY=`pwd`

	local dependencies=(`printf '%s\n' dependency.*`)
	for dependency in ${dependencies[@]}
	do
		echo dependency: $dependency
		if [ -h "$dependency" ]
		then
			dependencyId=${dependency#*dependency.}
			echo dependencyId: $dependencyId
			xp depend ${dependencyId%@}	
			realPath=`readlink dependency.${dependencyId%@}`
			echo dependency real path: $realPath
			cd -P "$realPath"
			run
		fi

		echo home: $ORIGINAL_STORY_HOME_DIRECTORY
		cd "$ORIGINAL_STORY_HOME_DIRECTORY"
	done
}

run

