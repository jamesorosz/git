#!/bin/bash
set -e

echo "🔵 Mise à jour du système..."
sudo apt update && sudo apt upgrade -y

echo "🟢 Outils système & qualité de vie..."
sudo apt install -y software-properties-common curl wget git unzip net-tools vim htop tree \
  bash-completion ca-certificates lsb-release gnupg apt-transport-https

echo "🎨 Outils d’admin & formation..."
sudo apt install -y figlet lolcat neofetch cowsay

echo "📦 Sauvegarde & fichiers..."
sudo apt install -y rsync rclone cifs-utils nfs-common sshfs zip unzip tar gzip p7zip-full

echo "🌐 Outils réseau avancés..."
sudo apt install -y curlie httpie ncat socat mitmproxy jq yq

echo "🖧 Diagnostic & outils réseau..."
sudo apt install -y traceroute mtr iputils-ping netcat-openbsd nmap tcpdump tshark ethtool \
  iperf3 dnsutils whois arping socat lsof fping sipcalc iftop bmon vnstat nload

echo "🔐 Sécurité & WiFi..."
sudo apt install -y wireshark aircrack-ng macchanger

echo "🛠️ Outils de configuration réseau..."
sudo apt install -y network-manager vlan bridge-utils ifenslave nftables iproute2 iptables \
  conntrack netplan.io

echo "📊 Monitoring & Debug système..."
sudo apt install -y sysstat iotop glances dstat lnav strace stress-ng inxi hwinfo

echo "🧱 Développement & build..."
sudo apt install -y git make gcc build-essential cmake pkg-config

echo "🖥️ Virtualisation : KVM / libvirt / virt-manager..."
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager \
  ovmf cloud-utils

echo "💠 VMware open-vm-tools (invité)..."
sudo apt install -y open-vm-tools open-vm-tools-desktop || true

echo "📦 Installation Ansible..."
sudo apt install -y ansible sshpass

echo "🐳 Installation Docker (version officielle)..."

sudo apt remove -y docker docker-engine docker.io containerd runc || true
sudo apt install -y ca-certificates curl gnupg lsb-release

sudo mkdir -p /etc/apt/keyrings
if [ ! -f /etc/apt/keyrings/docker.gpg ]; then
  curl -fsSL "https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg" \
    | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
fi

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
$(lsb_release -cs) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker "$USER" || true

echo "📀 Optionnel : installation de VirtualBox..."
read -p "Installer VirtualBox (y/n)? " vb_answer
if [[ "$vb_answer" =~ ^[Yy]$ ]]; then
  sudo apt install -y virtualbox virtualbox-ext-pack
fi

echo "📀 Optionnel : installation de VMware Workstation 17.x (nécessite le .bundle)..."
read -p "Chemin du fichier VMware-Workstation-*.bundle (laisser vide pour ignorer) : " vmw_path
if [ -n "$vmw_path" ] && [ -f "$vmw_path" ]; then
  chmod +x "$vmw_path"
  sudo "$vmw_path" --console --required
else
  echo "⚠️ VMware Workstation non installé (aucun .bundle fourni)."
fi

echo "🎉 Installation SYSTÈME DevOps terminée. Déconnecte-toi / reconnecte-toi pour appliquer le groupe docker."
