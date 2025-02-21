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

# https://huggingface.co/OwlMaster/SD3New/
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download OwlMaster/SD3New clip_g.safetensors --local-dir .
echo "saved: clip_g.safetensors"
chmod +x clip_g.safetensors

# https://huggingface.co/OwlMaster/SD3New/
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download OwlMaster/SD3New clip_l.safetensors --local-dir .
mv clip_l.safetensors clip_l_v1.safetensors
echo "saved: clip_l_v1.safetensors"
chmod +x clip_l_v1.safetensors

# https://huggingface.co/OwlMaster/SD3New/
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download OwlMaster/SD3New t5xxl_fp16.safetensors --local-dir .
echo "saved: t5xxl_fp16.safetensors"
chmod +x t5xxl_fp16.safetensors

# https://huggingface.co/OwlMaster/SD3New/
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download OwlMaster/SD3New t5xxl_fp8_e4m3fn.safetensors --local-dir .
echo "saved: t5xxl_fp8_e4m3fn.safetensors"
chmod +x t5xxl_fp8_e4m3fn.safetensors

# https://huggingface.co/OwlMaster/SD3New/
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download OwlMaster/SD3New t5xxl_fp8_e4m3fn_scaled.safetensors --local-dir .
echo "saved: t5xxl_fp8_e4m3fn_scaled.safetensors"
chmod +x t5xxl_fp8_e4m3fn_scaled.safetensors

# https://huggingface.co/OwlMaster/zer0int-CLIP-SAE-ViT-L-14
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download OwlMaster/zer0int-CLIP-SAE-ViT-L-14 clip_l.safetensors --local-dir .
mv clip_l.safetensors clip_l_v2.safetensors
echo "saved: clip_l_v2.safetensors"
chmod +x clip_l_v2.safetensors