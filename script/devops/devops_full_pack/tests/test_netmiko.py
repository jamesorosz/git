from netmiko import ConnectHandler, NetmikoTimeoutException, NetmikoAuthenticationException

DEVICE = {
    "device_type": "huawei",  # cisco_ios, huawei, fortinet, juniper, etc.
    "host": "192.168.0.1",
    "username": "admin",
    "password": "password",
    "port": 22,
}

COMMAND = "display version"  # pour Cisco: "show version", pour Fortinet: "get system status"

def main():
    print(f"🔗 Connexion à {DEVICE['host']} ({DEVICE['device_type']})...")
    try:
        conn = ConnectHandler(**DEVICE)
        output = conn.send_command(COMMAND)
        print("✅ Connexion OK, sortie de la commande :")
        print("-" * 60)
        print(output)
        print("-" * 60)
        conn.disconnect()
    except NetmikoTimeoutException as e:
        print(f"❌ Timeout de connexion : {e}")
    except NetmikoAuthenticationException as e:
        print(f"❌ Erreur d'authentification : {e}")
    except Exception as e:
        print(f"❌ Erreur inattendue : {e}")

if __name__ == "__main__":
    main()
