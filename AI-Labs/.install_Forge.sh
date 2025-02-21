#!/bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "Do not run this script as root!" 1>&2
   exit 1
fi

git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git Forge
cp .launchers/launch-ForgeUI-with-args.sh Forge
cd Forge && ./launch-ForgeUI-with-args.sh