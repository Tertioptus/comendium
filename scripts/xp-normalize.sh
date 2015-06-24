#!/bin/bash

CURRENT_PATH=`pwd`
BASE_PATH=`basename "$CURRENT_PATH"`
NEW_PATH=""

DEPENDENCY="d:00"
POINTS="p:00"
STATUS="s:u"
TRACK="t:00"
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
	if [[ $field =~ $d:.* ]]; then DEPENDENCY=$field; fi
	if [[ $field =~ $p:.* ]]; then POINTS=$field; fi
	if [[ $field =~ $s:.* ]]; then STATUS=$field; fi
	if [[ $field =~ $t:.* ]]; then TRACK=$field; fi
	if [[ $field =~ $c:.* ]]; then CONTEXT=$field; fi
	if [[ $field =~ $u:.* ]]; then USER=$field; fi
	if [[ $field =~ $a:.* ]]; then ACTION=$field; fi
	if [[ $field =~ $r:.* ]]; then RESOURCE=$field; fi
done

NEW_PATH="$DEPENDENCY|$POINTS|$STATUS|$TRACK|$CONTEXT|$USER|$ACTION|$RESOURCE"

echo new path: $NEW_PATH

cd ..

mv "${CURRENT_PATH}" "`dirname ${CURRENT_PATH}`/${NEW_PATH}"

cd "${NEW_PATH}"
