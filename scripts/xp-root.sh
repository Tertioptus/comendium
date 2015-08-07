#!/bin/bash

GIT_ROOT=`git rev-parse --show-cdup`
COMPENDIUM_ROOT=${GIT_ROOT}compendium

echo $COMPENDIUM_ROOT
