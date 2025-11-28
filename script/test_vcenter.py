from pyVim.connect import SmartConnect, Disconnect
import ssl

VCENTER = "192.168.x.x"
USERNAME = "administrator@vsphere.local"
PASSWORD = "TonMotDePasse"

# Désactiver les warnings SSL
context = ssl._create_unverified_context()

print("🔗 Connexion au vCenter...")
si = SmartConnect(
    host=VCENTER,
    user=USERNAME,
    pwd=PASSWORD,
    sslContext=context
)

print("🎉 Connexion réussie !")
print("Nom du vCenter :", si.content.about.fullName)

Disconnect(si)
