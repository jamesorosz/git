# DevOps Full Pack

Ce pack fournit un ensemble de scripts et d'outils pour préparer un poste Linux Debian/Ubuntu/Mint orienté réseau, virtualisation et DevOps.

## 1. Installation système

```bash
chmod +x install_system_devops.sh
./install_system_devops.sh
```

Cela installe :
- outils système, réseau, monitoring
- Ansible, Docker, KVM/libvirt, VirtualBox (optionnel), helper VMware Workstation .bundle

## 2. Environnement Python DevOps

```bash
chmod +x install_python_devops.sh
./install_python_devops.sh
```

Le venv est créé dans `~/python-envs/devops-env`.

## 3. Mise à jour / suppression du venv

```bash
./update_venv.sh
./remove_venv.sh
```

## 4. Menu DevOps interactif

```bash
chmod +x devops_menu.sh
./devops_menu.sh
```

Permet d'exécuter rapidement :
- tests réseau / SSH
- tests Netmiko / VMware / API REST / Ansible
- tests Docker / KVM
- mise à jour du venv
