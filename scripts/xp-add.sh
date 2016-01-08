#!/bin/bash
OIFS=$IFS
root="$(xp root)/backlog"
LEVEL="00"

IFS= read -p "Status: " STATUS  

# Is story hash provided?
if [[ $1 =~ ^[0-9]{2}$ ]]
then
	IFS= read -p "Application architecture layer: " ARCHITECTURE
else
	CONTEXT="f"	
	IFS= read -p "Points: " POINTS
fi

IFS= read -p "Story narrative: " NARRATIVE
IFS=$OIFS

STORY_PATH=$root/"s:$STATUS|l:$LEVEL|a:$ARCHITECTURE|n:$NARRATIVE"
mkdir $STORY_PATH
cd $STORY_PATH

if [[ -z POINTS ]]
then
	touch points.$POINTS
fi

touch tag.story
touch "#`echo -n $PWD$(date) | openssl dgst -md5 -binary | openssl enc -base64 | sed 's#/##g'`"

echo "Story successfully created."
