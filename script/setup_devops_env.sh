#!/bin/bash

# ============================
#  DevOps Python Environment
#  Auto Setup Script
# ============================

ENV_DIR="$HOME/python-envs/devops-env"
PYTHON=$(which python3)

echo -e "\n\033[1;32m=== Vérification des prérequis ===\033[0m"

# Vérifie python3
if [ -z "$PYTHON" ]; then
    echo -e "\033[1;31mPython3 n'est pas installé. Installation...\033[0m"
    sudo apt update && sudo apt install -y python3 python3-venv python3-pip python3-full
else
    echo -e "\033[1;32mPython trouvé : $PYTHON\033[0m"
fi

# Création du dossier des environnements
mkdir -p $HOME/python-envs

echo -e "\n\033[1;32m=== Création de l'environnement virtuel ===\033[0m"
python3 -m venv "$ENV_DIR"

echo -e "\033[1;32mActivation de l'environnement...\033[0m"
source "$ENV_DIR/bin/activate"

echo -e "\n\033[1;32m=== Mise à jour de pip ===\033[0m"
pip install --upgrade pip setuptools wheel

echo -e "\n\033[1;32m=== Installation des modules DevOps ===\033[0m"

pip install \
    paramiko \
    netmiko \
    python-nmap \
    pyvmomi \
    requests \
    boto3 \
    jinja2 \
    docker \
    psutil \
    pyyaml

echo -e "\n\033[1;32m=== Installation terminée ===\033[0m"
echo -e "\nVotre environnement DevOps est prêt ! 🎉"
echo -e "\nPour l'activer :"
echo -e "\033[1;36msource $ENV_DIR/bin/activate\033[0m"
echo -e "\nPour le désactiver :"
echo -e "\033[1;36mdeactivate\033[0m\n"
