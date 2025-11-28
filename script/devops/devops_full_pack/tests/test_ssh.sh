#!/bin/bash
set -e

TARGET="${1:-192.168.0.100}"
USER="${2:-admin}"

echo "🔐 Test SSH vers $USER@$TARGET (mode Batch)..."
ssh -o BatchMode=yes -o ConnectTimeout=5 "$USER@$TARGET" "echo '✅ SSH OK sur $(hostname)'" || \
  echo "❌ SSH KO (authentification ou connectivité)."
