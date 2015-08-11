#!/bin/bash
INSTALL_DIR="${BASH_SOURCE%/*}"
echo ${@:2}

eval $INSTALL_DIR/xp-$1.sh ${@:2}
