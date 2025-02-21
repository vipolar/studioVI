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

# https://huggingface.co/black-forest-labs/FLUX.1-Depth-dev
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download black-forest-labs/FLUX.1-Depth-dev flux1-depth-dev.safetensors model_index.json  --local-dir .
mv flux1-depth-dev.safetensors flux1_depth_dev.safetensors
echo "saved: flux1_depth_dev.safetensors"
chmod +x flux1_depth_dev.safetensors
echo "saved: model_index.json"