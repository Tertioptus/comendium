#!/bin/bash

INSTALL_DIR="${BASH_SOURCE%/*}"

eval source $INSTALL_DIR/xp-$1.sh `printf '"%s" ' "${@:2}"`
