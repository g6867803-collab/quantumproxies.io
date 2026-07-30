# QuantumProxies — Ruby quickstart (net/http).
# Rotating residential proxies: new IP per request, sticky sessions, geo-targeting.
# Get credentials at https://quantumproxies.io
require "net/http"
require "json"
require "uri"

USER = "YOUR_USERNAME" # from your dashboard
PASS = "YOUR_PASSWORD"
HOST = "residentialboson.quantumproxies.io"

def through_proxy(port:, user:)
  uri = URI("https://ipinfo.io/json")
  http = Net::HTTP.new(uri.host, uri.port, HOST, port, user, PASS)
  http.use_ssl = true
  http.open_timeout = http.read_timeout = 30
  JSON.parse(http.get(uri.path).body)
end

# Rotating: new IP on every request (port 9000)
puts "rotating: #{through_proxy(port: 9000, user: USER)["ip"]}"

# Country targeting: append -country-XX to the username
geo = through_proxy(port: 9000, user: "#{USER}-country-fr")
puts "fr exit:  #{geo["ip"]} #{geo["country"]}"

# Sticky session: same IP for `lifetime` minutes (port 10000)
sticky = "#{USER}-country-us-session-ab12-lifetime-10"
puts "sticky #1: #{through_proxy(port: 10_000, user: sticky)["ip"]}"
puts "sticky #2: #{through_proxy(port: 10_000, user: sticky)["ip"]}" # same IP
