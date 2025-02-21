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

# https://huggingface.co/black-forest-labs/FLUX.1-schnell
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download black-forest-labs/FLUX.1-schnell flux1-schnell.safetensors model_index.json --local-dir .
mv flux1-schnell.safetensors flux1_schnell.safetensors
echo "saved: flux1_schnell.safetensors"
chmod +x flux1_schnell.safetensors
echo "saved: model_index.json"