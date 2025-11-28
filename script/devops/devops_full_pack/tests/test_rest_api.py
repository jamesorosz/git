import requests

URL = "https://httpbin.org/get"

def main():
    print(f"🌐 Test requête GET vers {URL}...")
    try:
        resp = requests.get(URL, timeout=5)
        print(f"✅ Statut HTTP : {resp.status_code}")
        print("Extrait JSON :")
        data = resp.json()
        print({k: data.get(k) for k in ["url", "origin", "headers"]})
    except Exception as e:
        print(f"❌ Erreur HTTP : {e}")

if __name__ == "__main__":
    main()
