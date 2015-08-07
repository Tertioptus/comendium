#!/bin/bash

CURRENT_PATH=`pwd`
BASE_PATH=`basename "$CURRENT_PATH"`
NEW_PATH=""

STATUS="s:u"
LEVEL="l:99"
IDENTIFICATION="i:"
CONTEXT="c:"
USER="u:"
ACTION="a:"
RESOURCE="r:"

OIFS=$IFS
IFS='|'
FIELD_SET=($BASE_PATH)
IFS=$OIFS

for field in ${FIELD_SET[@]}
do
	if [[ $field =~ s:.* ]]; then STATUS=$field; fi
	if [[ $field =~ l:.* ]]; then LEVEL=$field; fi
	if [[ $field =~ i:.* ]]; then IDENTIFICATION=$field; fi
	if [[ $field =~ c:.* ]]; then CONTEXT=$field; fi
	if [[ $field =~ u:.* ]]; then USER=$field; fi
	if [[ $field =~ a:.* ]]; then ACTION=$field; fi
	if [[ $field =~ r:.* ]]; then RESOURCE=$field; fi
	
	
	if [[ $field =~ p:.* ]]; then LEVEL=l:${field:2:2}; fi
done

NEW_PATH="$STATUS|$LEVEL|$IDENTIFICATION|$CONTEXT|$USER|$ACTION|$RESOURCE"

cd ..

mv "${CURRENT_PATH}" "`dirname ${CURRENT_PATH}`/${NEW_PATH}"

cd "${NEW_PATH}"
