#!/bin/bash
set -e

TARGET="${1:-8.8.8.8}"

echo "🌐 Test réseau vers $TARGET..."
ping -c 4 "$TARGET" || echo "❌ Ping KO"

echo "📡 Route vers $TARGET..."
ip route get "$TARGET" || true

echo "🧠 Résolution DNS pour google.com..."
getent ahosts google.com || echo "❌ DNS KO (getent)"
