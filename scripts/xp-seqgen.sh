#!/bin/bash
root=$(xp root)

function getLast() {
	
	last=$(ls|awk -F"|" '{print substr($'3', $1 , 2)}'|sort|tail -1)
}

if [[ $1 =~ ^[0-9]+-[0-9]+ ]]
then
	last=$(ls|awk -F"|" '{print substr($3, 6, 2)}'|sort|tail -1)
else
	last=$(ls|awk -F"|" '{print substr($3, 3, 2)}'|sort|tail -1)
fi

next=$(($last+1))
echo $next
