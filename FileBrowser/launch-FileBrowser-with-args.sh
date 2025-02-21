#!bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "Do not run this script as root!" 1>&2
   exit 1
fi

./filebrowser --address localhost --port 7869 --root ..