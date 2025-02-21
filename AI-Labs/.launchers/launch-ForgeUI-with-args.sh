#!/bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "Do not run this script as root!" 1>&2
   exit 1
fi

#--enable-insecure-extension-access
COMMANDLINE_ARGS="--server-name localhost --port 7862 --listen --xformers --no-download-sd-model --do-not-download-clip" ./webui.sh