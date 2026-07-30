"""QuantumProxies — Python quickstart (requests).

Rotating residential proxies: new IP per request, sticky sessions, geo-targeting.
Get credentials at https://quantumproxies.io
"""
import requests

USER = "YOUR_USERNAME"  # from your dashboard
PASS = "YOUR_PASSWORD"

HOST = "residentialboson.quantumproxies.io"

# --- Rotating: new IP on every request (port 9000) ---
rotating = f"http://{USER}:{PASS}@{HOST}:9000"
r = requests.get("https://ipinfo.io/json",
                 proxies={"http": rotating, "https": rotating}, timeout=30)
print("rotating:", r.json()["ip"])

# --- Country targeting: append -country-XX to the username ---
us = f"http://{USER}-country-us:{PASS}@{HOST}:9000"
r = requests.get("https://ipinfo.io/json", proxies={"http": us, "https": us}, timeout=30)
print("us exit:", r.json()["ip"], r.json().get("country"))

# --- Sticky session: same IP for `lifetime` minutes (port 10000) ---
sticky = f"http://{USER}-country-us-session-ab12-lifetime-10:{PASS}@{HOST}:10000"
s = requests.Session()
s.proxies = {"http": sticky, "https": sticky}
print("sticky #1:", s.get("https://ipinfo.io/json", timeout=30).json()["ip"])
print("sticky #2:", s.get("https://ipinfo.io/json", timeout=30).json()["ip"])  # same IP

# --- City-level targeting ---
la = f"http://{USER}-country-us-state-california-city-losangeles:{PASS}@{HOST}:10000"
r = requests.get("https://ipinfo.io/json", proxies={"http": la, "https": la}, timeout=30)
print("los angeles:", r.json()["ip"], r.json().get("city"))
