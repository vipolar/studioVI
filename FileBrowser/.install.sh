#!/bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "Do not run this script as root!" 1>&2
   exit 1
fi

LATEST_URL=$(curl -s https://api.github.com/repos/filebrowser/filebrowser/releases/latest | grep "browser_download_url.*linux-amd64-filebrowser.tar.gz" | cut -d '"' -f 4)
wget "$LATEST_URL" -O filebrowser.tar.gz
tar -xvf filebrowser.tar.gz
rm filebrowser.tar.gz