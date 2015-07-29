#!/bin/bash

mkdir contribution:$1

cd contribution:$1

if [[ ! -z $2 ]]
then
 mkdir achievement:$2
fi

cd ..
