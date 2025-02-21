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

# https://huggingface.co/XLabs-AI/flux-controlnet-collections
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download XLabs-AI/flux-controlnet-collections flux-canny-controlnet.safetensors --local-dir .
mv flux-canny-controlnet.safetensors flux1_dev_controlnet_canny_v1.safetensors
echo "saved: flux1_dev_controlnet_canny_v1.safetensors"
chmod +x flux1_dev_controlnet_canny_v1.safetensors

# https://huggingface.co/XLabs-AI/flux-controlnet-collections
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download XLabs-AI/flux-controlnet-collections flux-canny-controlnet_v2.safetensors --local-dir .
mv flux-canny-controlnet_v2.safetensors flux1_dev_controlnet_canny_v2.safetensors
echo "saved: flux1_dev_controlnet_canny_v2.safetensors"
chmod +x flux1_dev_controlnet_canny_v2.safetensors

# https://huggingface.co/XLabs-AI/flux-controlnet-collections
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download XLabs-AI/flux-controlnet-collections flux-canny-controlnet-v3.safetensors --local-dir .
mv flux-canny-controlnet-v3.safetensors flux1_dev_controlnet_canny_v3.safetensors
echo "saved: flux1_dev_controlnet_canny_v3.safetensors"
chmod +x flux1_dev_controlnet_canny_v3.safetensors

# https://huggingface.co/XLabs-AI/flux-controlnet-collections
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download XLabs-AI/flux-controlnet-collections flux-depth-controlnet.safetensors --local-dir .
mv flux-depth-controlnet.safetensors flux1_dev_controlnet_depth_v1.safetensors
echo "saved: flux1_dev_controlnet_depth_v1.safetensors"
chmod +x flux1_dev_controlnet_depth_v1.safetensors

# https://huggingface.co/XLabs-AI/flux-controlnet-collections
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download XLabs-AI/flux-controlnet-collections flux-depth-controlnet_v2.safetensors --local-dir .
mv flux-depth-controlnet_v2.safetensors flux1_dev_controlnet_depth_v2.safetensors
echo "saved: flux1_dev_controlnet_depth_v2.safetensors"
chmod +x flux1_dev_controlnet_depth_v2.safetensors

# https://huggingface.co/XLabs-AI/flux-controlnet-collections
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download XLabs-AI/flux-controlnet-collections flux-depth-controlnet-v3.safetensors --local-dir .
mv flux-depth-controlnet-v3.safetensors flux1_dev_controlnet_depth_v3.safetensors
echo "saved: clflux1_dev_controlnet_depth_v3ip_l_v1.safetensors"
chmod +x flux1_dev_controlnet_depth_v3.safetensors

# https://huggingface.co/XLabs-AI/flux-controlnet-collections
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download XLabs-AI/flux-controlnet-collections flux-hed-controlnet.safetensors --local-dir .
mv flux-hed-controlnet.safetensors flux1_dev_controlnet_hed_v1.safetensors
echo "saved: flux1_dev_controlnet_hed_v1.safetensors"
chmod +x flux1_dev_controlnet_hed_v1.safetensors

# https://huggingface.co/XLabs-AI/flux-controlnet-collections
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download XLabs-AI/flux-controlnet-collections flux-hed-controlnet-v3.safetensors --local-dir .
mv flux-hed-controlnet-v3.safetensors flux1_dev_controlnet_hed_v3.safetensors
echo "saved: flux1_dev_controlnet_hed_v3.safetensors"
chmod +x flux1_dev_controlnet_hed_v3.safetensors

# https://huggingface.co/alimama-creative/FLUX.1-dev-Controlnet-Inpainting-Beta
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download alimama-creative/FLUX.1-dev-Controlnet-Inpainting-Beta diffusion_pytorch_model.safetensors --local-dir .
mv diffusion_pytorch_model.safetensors flux1_dev_controlnet_inpainting_beta.safetensors
echo "saved: flux1_dev_controlnet_inpainting_beta.safetensors"
chmod +x flux1_dev_controlnet_inpainting_beta.safetensors

# https://huggingface.co/promeai/FLUX.1-controlnet-lineart-promeai
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download promeai/FLUX.1-controlnet-lineart-promeai diffusion_pytorch_model.safetensors --local-dir .
mv diffusion_pytorch_model.safetensors flux1_dev_controlnet_lineart_promai.safetensors
echo "saved: flux1_dev_controlnet_lineart_promai.safetensors"
chmod +x flux1_dev_controlnet_lineart_promai.safetensors

# https://huggingface.co/raulc0399/flux_dev_openpose_controlnet
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download raulc0399/flux_dev_openpose_controlnet model.safetensors --local-dir .
mv model.safetensors flux1_dev_controlnet_openpose_beta.safetensors
echo "saved: flux1_dev_controlnet_openpose_beta.safetensors"
chmod +x flux1_dev_controlnet_openpose_beta.safetensors

# https://huggingface.co/jasperai/Flux.1-dev-Controlnet-Surface-Normals
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download jasperai/Flux.1-dev-Controlnet-Surface-Normals diffusion_pytorch_model.safetensors --local-dir .
mv diffusion_pytorch_model.safetensors flux1_dev_controlnet_surface_maps.safetensors
echo "saved: flux1_dev_controlnet_surface_maps.safetensors"
chmod +x flux1_dev_controlnet_surface_maps.safetensors

# https://huggingface.co/Shakker-Labs/FLUX.1-dev-ControlNet-Union-Pro
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download Shakker-Labs/FLUX.1-dev-ControlNet-Union-Pro diffusion_pytorch_model.safetensors --local-dir .
mv diffusion_pytorch_model.safetensors flux1_dev_controlnet_union_pro.safetensors
echo "saved: flux1_dev_controlnet_union_pro.safetensors"
chmod +x flux1_dev_controlnet_union_pro.safetensors

#https://huggingface.co/jasperai/Flux.1-dev-Controlnet-Upscaler
HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download jasperai/Flux.1-dev-Controlnet-Upscaler diffusion_pytorch_model.safetensors --local-dir .
mv diffusion_pytorch_model.safetensors flux1_dev_controlnet_upscaler.safetensors
echo "saved: flux1_dev_controlnet_upscaler.safetensors"
chmod +x flux1_dev_controlnet_upscaler.safetensors