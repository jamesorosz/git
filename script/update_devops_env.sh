#!/bin/bash

ENV_DIR="$HOME/python-envs/devops-env"

if [ ! -d "$ENV_DIR" ]; then
    echo "❌ Environnement introuvable : $ENV_DIR"
    exit 1
fi

echo "🔧 Activation du venv : $ENV_DIR"
source "$ENV_DIR/bin/activate"

echo "⬆️ Mise à jour de pip / setuptools / wheel..."
pip install --upgrade pip setuptools wheel

echo "⬆️ Mise à jour de tous les modules DevOps..."
pip install --upgrade \
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

echo "🎉 Mise à jour terminée."
deactivate
