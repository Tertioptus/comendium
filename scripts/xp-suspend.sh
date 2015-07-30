#!/bin/bash
#
# Set selected story as a dependency and suspend the current one
# xp-depend [track id]-[story id]
#
# Scenarios:
# xp-depend 00-01
STORY_PATH="${PWD}"
STORY=`basename "${STORY_PATH}"`
ID=${STORY:13:5}
RESULTS=()

#1.  find selected story with find by id
IFS=$'\t\n'
RESULTS+=(`find .. -maxdepth 1 -name "*$1*"`) 
CHILD_PATH=${RESULTS[0]}
unset $IFS #or IFS=$' \t\n'

#2.  create symbolic link to story
DEPENDENT="dependent.$1"
rm $DEPENDENT -f
ln -s "$CHILD_PATH" "$DEPENDENT"

#3.  create symbolic link to this current story in dependent story
cd "$DEPENDENT"
rm "dependency.$ID" -f 
ln -s "$STORY_PATH" "dependency.$ID"

#4.  set child story to suspended
#xp-set s:s

cd ..
