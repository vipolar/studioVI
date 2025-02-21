#!/bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "Do not run this script as root!" 1>&2
   exit 1
fi

git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui AUTO1
cp .launchers/launch-AUTO1111-with-args.sh AUTO1
cd AUTO1 && ./launch-AUTO1111-with-args.sh