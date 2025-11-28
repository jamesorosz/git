#!/bin/bash

ENV_DIR="$HOME/python-envs/devops-env"

if [ ! -d "$ENV_DIR" ]; then
    echo "❌ Aucun environnement à supprimer."
    exit 1
fi

read -p "⚠️ Confirme la suppression de $ENV_DIR (o/n) : " confirm

if [[ "$confirm" == "o" ]]; then
    rm -rf "$ENV_DIR"
    echo "🗑️ Environnement supprimé."
else
    echo "❌ Suppression annulée."
fi
