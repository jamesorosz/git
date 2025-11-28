from netmiko import ConnectHandler

device = {
    "device_type": "huawei",  # ou cisco_ios / fortinet / juniper / hp_comware
    "host": "192.168.x.x",
    "username": "admin",
    "password": "TonMotDePasse",
}

print("🔗 Connexion au device...")
conn = ConnectHandler(**device)

print("🎉 Connexion réussie ->", device["host"])
print("📄 Sortie de 'display version' :\n")

output = conn.send_command("display version")
print(output)

conn.disconnect()

# Cisco : device_type=cisco_ios

# Huawei VRP : device_type=huawei

# Fortinet : device_type=fortinet

# Juniper : device_type=juniper

# HP/Aruba Comware : hp_comware
