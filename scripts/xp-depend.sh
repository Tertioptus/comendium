#!/bin/bash
#
# Set selected story as a dependency and suspend the current one
# xp-depend [track id]-[story id]
#
# Scenarios:
# xp-depend 00-01
CHILD_STORY_PATH=${PWD}
CHILD_STORY=`basename ${CHILD_STORY_PATH}`
CHILD_ID=${CHILD_STORY:11:5}

#1.  find selected story with find by id
PARENT_PATH+=(`find .. -name "*${1}*"`) 
#2.  create symbolic link to story
#ln -s $PARENT_PATH dependency.$1

#3.  set this story to suspended
xp-set s:s

#4.  create symbolic link to this current story in dependent story
cd dependency.$1
ln -s $CHILD_STORY_PATH dependent.$CHILD_ID

#5. run point count on parent
#xp-point-count
