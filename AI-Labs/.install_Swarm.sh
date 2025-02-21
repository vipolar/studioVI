#!/bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "Do not run this script as root!" 1>&2
   exit 1
fi

git clone https://github.com/mcmonkeyprojects/SwarmUI Swarm
cp .launchers/launch-SwarmUI-with-args.sh Swarm
cd Swarm && ./launch-SwarmUI-with-args.sh
cd ..