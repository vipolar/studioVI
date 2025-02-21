#!/bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "Do not run this script as root!" 1>&2
   exit 1
fi

LAST_LINE=$(huggingface-cli whoami | tail -n 1)
if [[ "$LAST_LINE" == "Not logged in" ]]; then
   echo "You are not logged into Hugging Face!"
   echo "Run the following command to log in:"
   echo -e "\n  huggingface-cli login\n"
   exit 1
fi

# https://huggingface.co/Aperolka/ChristinaYT/
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download Aperolka/ChristinaYT 512/flux1_dev_christina_yt_512.safetensors --local-dir .
echo "saved: 512/flux1_dev_christina_yt_512.safetensors"
chmod +x 512/flux1_dev_christina_yt_512.safetensors