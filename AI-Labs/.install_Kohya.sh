#!/bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "Do not run this script as root!" 1>&2
   exit 1
fi

git clone --branch sd3-flux.1 --single-branch --recursive https://github.com/bmaltais/kohya_ss.git Kohya
cp .launchers/launch-Kohya-with-args.sh Kohya
cd Kohya && ./setup.sh -u
cd venv/bin/ && ./accelerate config
cd ../.. && ./launch-Kohya-with-args.sh 