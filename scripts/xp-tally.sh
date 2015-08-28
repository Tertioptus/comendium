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
		if [[ -n $links ]] 
		then
			for l in ${links[@]}
			do
				if [ -h "$l" ]
				then
					realPath=`readlink ${l%@}`
					left=${realPath%|i:*}
					right=${left#*|l:}
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
	xp set l:$LEVEL
	local ORIGINAL_STORY_HOME_DIRECTORY=`pwd`
	local dependencies=(`printf '%s\n' dependency.*`)
	local OPEN_DEPENDENCY_COUNT=0
	for dependency in ${dependencies[@]}
	do
		if [ -h "$dependency" ]
		then
			dependencyId=${dependency#*dependency.}
			xp depend ${dependencyId%@}	
			realPath=`readlink dependency.${dependencyId%@}`
			if [[ ! $realPath =~ "s:x" ]]
			then
				OPEN_DEPENDENCY_COUNT=$(($OPEN_DEPENDENCY_COUNT+1))
				cd -P "$realPath"
				run
			fi
		fi

		cd "$ORIGINAL_STORY_HOME_DIRECTORY"
	done
	if [ $OPEN_DEPENDENCY_COUNT -eq 0 ] && [[ $ORIGINAL_STORY_HOME_DIRECTORY =~ "s:s" ]]
	then
		cd "$ORIGINAL_STORY_HOME_DIRECTORY"
		xp set s:a
	fi
}

run

