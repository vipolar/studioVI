#!/bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "Do not run this script as root!" 1>&2
   exit 1
fi

./launch-linux.sh --host localhost --port 7864 --launch_mode none