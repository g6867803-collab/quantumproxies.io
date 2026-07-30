#!/usr/bin/env bash
# QuantumProxies — curl quickstart.
# Rotating residential proxies: new IP per request, sticky sessions, geo-targeting.
# Get credentials at https://quantumproxies.io

USER="YOUR_USERNAME"   # from your dashboard
PASS="YOUR_PASSWORD"
HOST="residentialboson.quantumproxies.io"

# Rotating: new IP on every request (port 9000)
curl -s -x "http://$USER:$PASS@$HOST:9000" https://ipinfo.io/json

# Country targeting: append -country-XX to the username
curl -s -x "http://$USER-country-us:$PASS@$HOST:9000" https://ipinfo.io/json

# Sticky session: same IP for `lifetime` minutes (port 10000)
curl -s -x "http://$USER-country-us-session-ab12-lifetime-10:$PASS@$HOST:10000" https://ipinfo.io/json
curl -s -x "http://$USER-country-us-session-ab12-lifetime-10:$PASS@$HOST:10000" https://ipinfo.io/json  # same IP

# City-level targeting
curl -s -x "http://$USER-country-us-state-california-city-losangeles:$PASS@$HOST:10000" https://ipinfo.io/json

# SOCKS5 on port 12000 (use socks5h:// so DNS resolves through the proxy)
curl -s -x "socks5h://$USER:$PASS@$HOST:12000" https://ipinfo.io/json
