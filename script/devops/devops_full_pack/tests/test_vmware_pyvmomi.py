import ssl
from pyVim.connect import SmartConnect, Disconnect
from pyVmomi import vim

VCENTER = "192.168.0.10"
USERNAME = "administrator@vsphere.local"
PASSWORD = "ChangeMe!"

def main():
    print(f"🔗 Connexion au vCenter {VCENTER}...")
    context = ssl._create_unverified_context()
    try:
        si = SmartConnect(host=VCENTER, user=USERNAME, pwd=PASSWORD, sslContext=context)
        about = si.content.about
        print("✅ Connexion OK")
        print(f"Version : {about.fullName} ({about.version})")
        print(f"Build   : {about.build}")
        Disconnect(si)
    except Exception as e:
        print(f"❌ Erreur de connexion vCenter : {e}")

if __name__ == "__main__":
    main()
