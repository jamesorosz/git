#!/bin/bash
set -e

ENV_DIR="$HOME/python-envs/devops-env"
REQ_FILE="$(dirname "$0")/requirements.txt"

if [ ! -d "$ENV_DIR" ]; then
  echo "❌ Venv introuvable : $ENV_DIR"
  exit 1
fi

if [ ! -f "$REQ_FILE" ]; then
  echo "❌ requirements.txt introuvable à côté du script."
  exit 1
fi

echo "🟣 Activation du venv..."
# shellcheck disable=SC1090
source "$ENV_DIR/bin/activate"

echo "⬆️ Mise à jour de pip/setuptools/wheel..."
pip install --upgrade pip setuptools wheel

echo "⬆️ Mise à jour des modules depuis requirements.txt..."
pip install --upgrade -r "$REQ_FILE"

echo "🎉 Mise à jour du venv terminée."
