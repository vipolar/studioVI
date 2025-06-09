#!/bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "Do not run this script as root!" 1>&2
   exit 1
fi

export NEEDRESTART_MODE=a
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get update -y && sudo -E apt-get upgrade -y
sudo -E apt-get install -y curl wget git nginx fail2ban python3 python3-tk python3-pip python3-venv libgl1 libglib2.0-0 dotnet-sdk-8.0 google-perftools debian-keyring debian-archive-keyring apt-transport-https

UBUNTU_VERSION=$(lsb_release -rs)
if [[ "$UBUNTU_VERSION" == "24.04" ]]; then
# Getting libtinfo5 from lunar/universe repository (ubuntu 24.04)
wget http://security.ubuntu.com/ubuntu/pool/universe/n/ncurses/libtinfo5_6.3-2ubuntu0.1_amd64.deb
sudo -E apt-get install ./libtinfo5_6.3-2ubuntu0.1_amd64.deb -yz
rm libtinfo5_6.3-2ubuntu0.1_amd64.deb
fi

# Getting CUDA 12.4 tookit from the official nvidia repository for ubuntu 22.04 LTS
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb && sudo apt-get update
sudo -E apt-get -y install cuda-toolkit-12-4
rm cuda-keyring_1.1-1_all.deb

# Getting CUDNN 8.9.7.29 from nvidia: https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/
wget https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-8.9.7.29_cuda12-archive.tar.xz
tar -xvf cudnn-linux-x86_64-8.9.7.29_cuda12-archive.tar.xz
sudo cp cudnn-*-archive/include/cudnn*.h /usr/local/cuda/include
sudo cp -P cudnn-*-archive/lib/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*
cat /usr/local/cuda/include/cudnn_version.h | grep CUDNN_MAJOR -A 2

#sudo rm /etc/nginx/sites-enabled/default
#sudo cp .resources/sshd/. /etc/ssh/sshd_config.d/
sudo cp /etc/fail2ban/fail2ban.conf /etc/fail2ban/fail2ban.local
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo systemctl enable fail2ban

cat bashrc.append >> ~/.bashrc