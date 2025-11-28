import os
import subprocess
import sys

REQ_FILE = "requirements.txt"

if not os.path.exists(REQ_FILE):
    print("❌ requirements.txt introuvable.")
    sys.exit(1)

print("📦 Installation des modules listés dans requirements.txt...")

cmd = [sys.executable, "-m", "pip", "install", "-r", REQ_FILE]
subprocess.run(cmd, check=True)

print("🎉 Installation terminée !")
