#!/bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "Do not run this script as root!" 1>&2
   exit 1
fi

read -p "Have you updated your Ubuntu server installation? (yes/no): " ANSWER
ANSWER=$(echo "$ANSWER" | tr '[:upper:]' '[:lower:]')

if [[ "$ANSWER" != "yes" ]]; then
    echo -e "\nYou need to update your Ubuntu system. Run the following commands:"
    echo -e "\n  sudo apt-get update && sudo apt-get upgrade -y"
    echo -e "\nAfter updating, rerun this script."
    exit 1
fi

sudo apt-get install -y fail2ban nginx curl wget git git-lfs python3 python3-tk python3-pip python3-venv libgl1 libglib2.0-0 dotnet-sdk-8.0 google-perftools debian-keyring debian-archive-keyring apt-transport-https

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb && sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-4
rm cuda-keyring_1.1-1_all.deb

sudo rm /etc/nginx/sites-enabled/default
sudo cp .resources/sshd/. /etc/ssh/sshd_config.d/
sudo cp /etc/fail2ban/fail2ban.conf /etc/fail2ban/fail2ban.local
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo systemctl enable fail2ban

cat .resources/bashrcAppend >> ~/.bashrc
pip install -U "huggingface_hub[hf_transfer]"
pip install -U "huggingface_hub[cli]"
pip install hf_transfer

read -p "Your email for git: " GIT_EMAIL
git config --global user.email "$GIT_EMAIL"
read -p "Your username for git: " GIT_USER
git config --global user.name "$GIT_USER"
read -p "Editor for git (vim/nano): " GIT_EDITOR
git config --global core.editor "$GIT_EDITOR"

#tar -xvf cudnn-linux-x86_64-8.9.7.29_cuda12-archive.tar.xz
#sudo cp cudnn-*-archive/include/cudnn*.h /usr/local/cuda/include
#sudo cp -P cudnn-*-archive/lib/libcudnn* /usr/local/cuda/lib64
#sudo chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*
#cat /usr/local/cuda/include/cudnn_version.h | grep CUDNN_MAJOR -A 2
