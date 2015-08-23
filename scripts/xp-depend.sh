#!/bin/bash
#
# Set selected story as a dependency and suspend the current one
# xp-depend [track id]-[story id]
#
# Scenarios:
# xp-depend 00-01
CHILD_STORY_PATH="${PWD}"
CHILD_STORY=`basename "${CHILD_STORY_PATH}"`
CHILD_ID=${CHILD_STORY:13:5}
RESULTS=()

#1.  find selected story with find by id
IFS=$'\t\n'
RESULTS+=(`find .. -maxdepth 1 -name "*${1}*"`) 
PARENT_PATH=${RESULTS[0]}
unset $IFS #or IFS=$' \t\n'

#2.  create symbolic link to story
rm "dependency.$1" -f
ln -s "$PARENT_PATH" "dependency.$1"

#3.  set this story to suspended
xp set s:s

#4.  create symbolic link to this current story in dependent story
cd "dependency.$1"
rm "dependent.$CHILD_ID" -f 
ln -s "$CHILD_STORY_PATH" "dependent.$CHILD_ID"

cd ..
