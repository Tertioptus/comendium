#!/bin/bash
#
# Set selected story as a dependency and suspend the current one
# xp-depend [track id]-[story id]
#
# Scenarios:
# xp-depend 00-01


#1.  find selected story with find by id

#2.  Or, create new story

#3.  create symbolic link to story
ln -s dependency.$1

#4.  set this story to suspended
xp-set s:s

#5.  create symbolic link to this current story in dependent story
cd dependency.$1
ln -s dependent.

#6.  run dependency check on dependant story 

