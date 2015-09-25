#!/bin/bash
OIFS=$IFS
root="$(xp root)/backlog"
LEVEL="00"

IFS= read -p "Status: " STATUS  

# Is backlog Id provided?
if [[ $1 =~ ^[0-9]{2}$ ]]
then
	ID=$(xp seqgen $1)
	IFS= read -p "Context: " CONTEXT
else
	CONTEXT="feature"	
	ID=$(xp seqgen)-00
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
