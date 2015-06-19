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
	echo $FIELD_TYPE 
	NEW_PATH=$BASE_PATH"|"$1
else # Find field and update
	OIFS=$IFS
	IFS='|'
	FIELD_SET=($BASE_PATH)
	IFS=$OIFS
	
	echo "[FIELDS] type: ${FIELD_TYPE}; value: ${FIELD_VALUE}"


	for field in ${FIELD_SET[@]}
	do
		if [[ ${#NEW_PATH}>0 ]]
		then
			NEW_PATH+="|"
		fi

		if [[ $field =~ $FIELD_TYPE:.* ]]
		then
			NEW_PATH+=$1
		else
			NEW_PATH+=$field
		fi
	done
fi


echo new path: $NEW_PATH

cd ..

mv "${CURRENT_PATH}" "`dirname ${CURRENT_PATH}`/${NEW_PATH}"

cd "${NEW_PATH}"
