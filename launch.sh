#!/bin/bash

if [ -z "$1" ]; then
    source src/mw-presence-en.sh
else
    source src/mw-presence-$1.sh
fi
