#!/bin/bash

#find compendium root

#append backlog

read -p "Status: u: " STATUS  
read -p " Points: 00: " POINTS
read -p "Id: " ID
read -p "Context: " CONTEXT
read -p "User: " USER
read -p "Action: " ACTION
read -p "Resource:" RESOURCE

STORY_PATH="s:$STATUS|p:$POINTS|i:$ID|c:$CONTEXT|u:$USER|a:$ACTION|r:$RESOURCE"
mkdir $STORY_PATH
cd $STORY_PATH

touch tag.story
