import subprocess
import os
import sys

INVENTORY = os.environ.get("ANSIBLE_INVENTORY", "inventory.ini")

def main():
    print("🧪 Test Ansible ping via SSH...")
    if not os.path.exists(INVENTORY):
        print(f"⚠️ Fichier d'inventaire {INVENTORY} introuvable.")
        print("   Crée un fichier inventory.ini, par ex :")
        print("   [all]\n   192.168.0.100 ansible_user=admin")
        sys.exit(1)
    try:
        cmd = ["ansible", "all", "-i", INVENTORY, "-m", "ping"]
        print("▶️ Commande :", " ".join(cmd))
        subprocess.run(cmd, check=False)
    except FileNotFoundError:
        print("❌ ansible n'est pas installé ou introuvable dans le PATH.")
    except Exception as e:
        print(f"❌ Erreur Ansible : {e}")

if __name__ == "__main__":
    main()
