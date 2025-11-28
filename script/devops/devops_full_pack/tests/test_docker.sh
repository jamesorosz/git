#!/bin/bash
set -e

echo "🐳 Test Docker..."
if ! command -v docker >/dev/null 2>&1; then
  echo "❌ docker introuvable."
  exit 1
fi

docker info >/dev/null 2>&1 && echo "✅ Docker daemon OK" || echo "❌ Docker daemon non accessible."

echo "▶️ docker ps (conteneurs en cours) :"
docker ps || true
