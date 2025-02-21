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
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download XLabs-AI/flux-ip-adapter-v2 ip_adapter_workflow.json --local-dir .
mv ip_adapter_workflow.json flux1_dev_ip_adapter_workflow.json
echo "saved: flux1_dev_ip_adapter_workflow.json"

# https://huggingface.co/XLabs-AI/flux-controlnet-collections
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download XLabs-AI/flux-controlnet-collections workflows/hed_workflow.json --local-dir .
mv workflows/hed_workflow.json flux1_dev_controlnet_hed_workflow.json
echo "saved: flux1_dev_controlnet_hed_workflow.json"
rm -rf workflows/

# https://huggingface.co/XLabs-AI/flux-controlnet-collections
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download XLabs-AI/flux-controlnet-collections workflows/depth_workflow.json --local-dir .
mv workflows/depth_workflow.json flux1_dev_controlnet_depth_workflow.json
echo "saved: flux1_dev_controlnet_depth_workflow.json"
rm -rf workflows/

# https://huggingface.co/XLabs-AI/flux-controlnet-collections
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download XLabs-AI/flux-controlnet-collections workflows/canny_workflow.json --local-dir .
mv workflows/canny_workflow.json flux1_dev_controlnet_canny_workflow.json
echo "saved: flux1_dev_controlnet_canny_workflow.json"
rm -rf workflows/

# https://huggingface.co/alimama-creative/FLUX.1-dev-Controlnet-Inpainting-Alpha (beta version: control-strength = 1.0, control-end-percent = 1.0, true_cfg = 1.0)
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download alimama-creative/FLUX.1-dev-Controlnet-Inpainting-Alpha images/alimama-creative-flux-inapint-cn-beta.json --local-dir .
mv images/alimama-creative-flux-inapint-cn-beta.json flux1_dev_controlnet_inpainting_workflow.json
echo "saved: flux1_dev_controlnet_inpainting_workflow.json"
rm -rf images/

# https://huggingface.co/promeai/FLUX.1-controlnet-lineart-promeai
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download promeai/FLUX.1-controlnet-lineart-promeai example-workflow.json --local-dir .
mv example-workflow.json flux1_dev_controlnet_lineart_workflow.json
echo "saved: flux1_dev_controlnet_lineart_workflow.json"
