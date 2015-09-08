#!/bin/bash
root=$(xp root)

function printLast() {
	echo $(ls|awk -F"|" "{print substr(\$3, $1 , 2)}"|sort|tail -1)
}

if [[ $1 =~ ^[0-9]{2}$ ]]
then
	last=$(printLast 6)
else
	last=$(printLast 3)
fi

next=$(($last+1))
echo `printf %02d $next`
