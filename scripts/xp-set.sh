#!/bin/bash

CURRENT_PATH=`pwd`
BASE_PATH=`basename "$CURRENT_PATH"`
NEW_PATH=""

OIFS=$IFS
IFS=':'
FIELD=($1)
FIELD_TYPE=${FIELD[0]}
FIELD_VALUE=${FIELD[1]}
IFS=$OIFS

if ! [[ $BASE_PATH =~ .*$FIELD_TYPE:.* ]]
then # Add new field if none present
	NEW_PATH=$BASE_PATH"|"$1
else # Find field and update
	OIFS=$IFS
	IFS='|'
	FIELD_SET=($BASE_PATH)
	for field in ${FIELD_SET[@]}
	do
		if [[ ${#NEW_PATH}>0 ]]
		then
			NEW_PATH+="|"
		fi

		if [[ $field =~ $FIELD_TYPE:.* ]]
		then
			NEW_PATH+="$1"
		else
			NEW_PATH+="$field"
		fi
	done
	IFS=$OIFS
fi

MOVE_PATH="${CURRENT_PATH%/s*}/${NEW_PATH#*.}"
if [[ ! "$CURRENT_PATH" =~ "$MOVE_PATH" ]]
then
	cd ..
	mv "${CURRENT_PATH}" "${MOVE_PATH}"
	cd "${NEW_PATH}"
fi
