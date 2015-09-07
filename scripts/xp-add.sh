#!/bin/bash
OIFS=$IFS
root="$(xp root)/backlog"

IFS= read -p "Status: u: " STATUS  
IFS= read -p "Context: " CONTEXT

if [[ $CONTEXT =~ feature ]]
then
	IFS= read -p "Points: " POINTS
fi
IFS= read -p "User: " USER
IFS= read -p "Action: " ACTION
IFS= read -p "Resource:" RESOURCE
IFS=$OIFS

STORY_PATH=$root/"s:$STATUS|l:$LEVEL|i:$ID|c:$CONTEXT|u:$USER|a:$ACTION|r:$RESOURCE"
mkdir $STORY_PATH
cd $STORY_PATH

touch tag.story

echo $ID
