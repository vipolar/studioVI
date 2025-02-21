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

# https://huggingface.co/XLabs-AI/flux-ip-adapter-v2
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download XLabs-AI/flux-ip-adapter-v2 ip_adapter.safetensors --local-dir .
mv ip_adapter.safetensors flux1_dev_ip_adapter_v2.safetensors
echo "saved: flux1_dev_ip_adapter_v2.safetensors"
chmod +x flux1_dev_ip_adapter_v2.safetensors