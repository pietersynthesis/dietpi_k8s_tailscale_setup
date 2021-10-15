#!/bin/bash

# Install docker & apparmor
apt update && apt upgrade -y
apt install docker.io docker-compose apparmor-utils -y
systemctl enable docker
systemctl start docker
usermod -aG docker dietpi


# Install kubernetes cli tools
apt install -y apt-transport-https ca-certificates curl
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl


# Install tailscale
curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.gpg | apt-key add -
curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.list | tee /etc/apt/sources.list.d/tailscale.list

apt-get update
apt-get install -y tailscale