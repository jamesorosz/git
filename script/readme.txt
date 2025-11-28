python3 auto_install.py


#outils divers


outils utiles pour l’admin et la formation

sudo apt install -y figlet lolcat neofetch cowsay

1️⃣ Sauvegarde & fichiers

sudo apt install -y rsync rclone cifs-utils nfs-common sshfs zip unzip tar gzip p7zip-full

Autres utilitaires réseau avancés

sudo apt install -y curlie httpie ncat socat mitmproxy jq yq

9️⃣ Monitoring / Debug système

sudo apt install -y sysstat iotop glances dstat lnav strace stress-ng inxi hwinfo

8️⃣ Développement / gestion de version

sudo apt install -y git make gcc build-essential cmake pkg-config

7️⃣ Virtualisation / VMware / KVM
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager ovmf cloud-utils

sudo apt install -y open-vm-tools open-vm-tools-desktop

pip3 install pyvmomi

6️⃣ Docker & outils conteneurs

sudo apt remove -y docker docker-engine docker.io containerd runc
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker $USER

Optionnel : Podman & Buildah)

sudo apt install -y podman buildah skopeo

5️⃣ Ansible (automatisation)

sudo apt install -y ansible sshpass

ou version récente via PPA)

sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

4️⃣ Environnement Python / DevOps

sudo apt install -y python3 python3-pip python3-venv python3-dev python3-setuptools python3-wheel

Libs usuelles Python :

pip3 install --upgrade pip
pip3 install requests paramiko netmiko nmap jinja2 ansible-core boto3 docker psutil pyyaml

3️⃣ Outils de configuration réseau

sudo apt install -y network-manager vlan bridge-utils ifenslave nftables iproute2 iptables conntrack netplan.io

2️⃣ Diagnostic & outils réseau

sudo apt install -y traceroute mtr iputils-ping netcat-openbsd nmap tcpdump tshark ethtool iperf3 dnsutils whois arping socat lsof fping sipcalc iftop bmon vnstat nload

sudo apt install -y wireshark aircrack-ng macchanger

1️⃣ Mise à jour de base

sudo apt update && sudo apt upgrade -y
sudo apt install -y software-properties-common curl wget git unzip net-tools vim htop tree bash-completion ca-certificates lsb-release gnupg apt-transport-https




















































