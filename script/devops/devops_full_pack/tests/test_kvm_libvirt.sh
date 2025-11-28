#!/bin/bash
set -e

echo "🖥️ Test KVM / libvirt..."

if ! command -v virsh >/dev/null 2>&1; then
  echo "❌ virsh introuvable (libvirt-clients non installé ?)"
  exit 1
fi

echo "🔎 Connexion à libvirt (qemu:///system)..."
virsh -c qemu:///system list --all || echo "⚠️ Impossible de lister les VMs (droits ou service libvirtd ?)"

echo "ℹ️ Vérification support KVM dans le CPU..."
egrep -c '(vmx|svm)' /proc/cpuinfo || echo "⚠️ Pas de support matériel VMX/SVM détecté."
