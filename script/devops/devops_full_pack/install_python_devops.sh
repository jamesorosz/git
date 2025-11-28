#!/bin/bash
set -e

ENV_DIR="$HOME/python-envs/devops-env"
mkdir -p "$HOME/python-envs"

echo "🐍 Installation des prérequis Python..."
sudo apt install -y python3 python3-venv python3-pip python3-dev python3-setuptools python3-wheel

echo "🔧 Création du venv : $ENV_DIR"
python3 -m venv "$ENV_DIR"

echo "🟣 Activation du venv..."
# shellcheck disable=SC1090
source "$ENV_DIR/bin/activate"

echo "⬆️ Mise à jour de pip..."
pip install --upgrade pip setuptools wheel

echo "📦 Installation des modules DevOps Python depuis requirements.txt..."
REQ_FILE="$(dirname "$0")/requirements.txt"
if [ ! -f "$REQ_FILE" ]; then
  echo "❌ requirements.txt introuvable à côté du script."
  exit 1
fi

pip install -r "$REQ_FILE"

echo "🎉 Environnement Python DevOps installé."
echo "➡️ Pour activer : source $ENV_DIR/bin/activate"
