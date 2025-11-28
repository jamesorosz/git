#!/bin/bash
set -e

ENV_DIR="$HOME/python-envs/devops-env"

if [ ! -d "$ENV_DIR" ]; then
  echo "❌ Aucun environnement à supprimer : $ENV_DIR"
  exit 0
fi

read -p "⚠️ Confirmer la suppression de $ENV_DIR (y/n)? " ans
if [[ "$ans" =~ ^[Yy]$ ]]; then
  rm -rf "$ENV_DIR"
  echo "🗑️ Environnement supprimé."
else
  echo "❌ Suppression annulée."
fi
