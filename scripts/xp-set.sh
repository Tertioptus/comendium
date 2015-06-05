#!/bin/bash

CURRENT_PATH=`pwd`
BASE_PATH=`basename $CURRENT_PATH`

OIFS=$IFS
IFS='|'
FIELD_SET=($BASE_PATH)
IFS=':'
FIELD=($1)
FIELD_TYPE=${FIELD[0]}
FIELD_VALUE=${FIELD[1]}

echo "[FIELDS] type: ${FIELD_TYPE}; value: ${FIELD_VALUE}"

IFS=$OIFS

NEW_PATH=""
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
echo new path: $NEW_PATH

cd ..

mv ${CURRENT_PATH} "`dirname ${CURRENT_PATH}`/${NEW_PATH}"

cd "${NEW_PATH}"
