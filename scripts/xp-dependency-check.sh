#!/bin/bash
DEPENDENTS+=(`ls`)

TOTAL=0
for i in $( ls dependency* ) 
do
	echo $i
	cd "$i"
	TEST=$PWD
	#TESTD=`basename ($TEST)`
	echo test:$TEST
done
