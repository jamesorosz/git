#!/bin/bash

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_DIR="$HOME/python-envs/devops-env"

activate_venv() {
  if [ -d "$ENV_DIR" ]; then
    # shellcheck disable=SC1090
    source "$ENV_DIR/bin/activate"
  else
    echo "⚠️ Venv introuvable : $ENV_DIR"
  fi
}

while true; do
  clear
  echo "==========================="
  echo "   🚀 DevOps Tool Menu"
  echo "==========================="
  echo "1) Test réseau (ping/route/DNS)"
  echo "2) Test SSH"
  echo "3) Test Netmiko (Huawei/Cisco/Forti...)"
  echo "4) Test VMware (pyvmomi)"
  echo "5) Test API REST JSON"
  echo "6) Test Ansible ping (SSH)"
  echo "7) Test Docker"
  echo "8) Test KVM/libvirt"
  echo "9) Activer le venv DevOps"
  echo "10) Mettre à jour le venv DevOps"
  echo "11) Quitter"
  echo "---------------------------"
  read -p "Choix [1-11] : " choice

  case "$choice" in
    1)
      bash "$BASE_DIR/tests/test_network.sh"
      read -p "Appuie sur Entrée pour continuer..."
      ;;
    2)
      read -p "IP/host SSH (défaut 192.168.0.100) : " ssh_host
      read -p "User SSH (défaut admin) : " ssh_user
      ssh_host=${ssh_host:-192.168.0.100}
      ssh_user=${ssh_user:-admin}
      bash "$BASE_DIR/tests/test_ssh.sh" "$ssh_host" "$ssh_user"
      read -p "Appuie sur Entrée pour continuer..."
      ;;
    3)
      activate_venv
      python "$BASE_DIR/tests/test_netmiko.py"
      read -p "Appuie sur Entrée pour continuer..."
      ;;
    4)
      activate_venv
      python "$BASE_DIR/tests/test_vmware_pyvmomi.py"
      read -p "Appuie sur Entrée pour continuer..."
      ;;
    5)
      activate_venv
      python "$BASE_DIR/tests/test_rest_api.py"
      read -p "Appuie sur Entrée pour continuer..."
      ;;
    6)
      activate_venv
      python "$BASE_DIR/tests/test_ansible_ssh.py"
      read -p "Appuie sur Entrée pour continuer..."
      ;;
    7)
      bash "$BASE_DIR/tests/test_docker.sh"
      read -p "Appuie sur Entrée pour continuer..."
      ;;
    8)
      bash "$BASE_DIR/tests/test_kvm_libvirt.sh"
      read -p "Appuie sur Entrée pour continuer..."
      ;;
    9)
      if [ -d "$ENV_DIR" ]; then
        echo "➡️ Pour activer le venv, exécute :"
        echo "source \"$ENV_DIR/bin/activate\""
      else
        echo "⚠️ Venv introuvable : $ENV_DIR"
      fi
      read -p "Appuie sur Entrée pour continuer..."
      ;;
    10)
      bash "$BASE_DIR/update_venv.sh"
      read -p "Appuie sur Entrée pour continuer..."
      ;;
    11)
      echo "👋 Bye."
      exit 0
      ;;
    *)
      echo "❌ Choix invalide."
      sleep 1
      ;;
  esac
done
