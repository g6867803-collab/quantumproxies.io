// QuantumProxies — Go quickstart (net/http).
// Rotating residential proxies: new IP per request, sticky sessions, geo-targeting.
// Get credentials at https://quantumproxies.io
package main

import (
	"fmt"
	"io"
	"net/http"
	"net/url"
	"time"
)

const (
	user = "YOUR_USERNAME" // from your dashboard
	pass = "YOUR_PASSWORD"
	host = "residentialboson.quantumproxies.io"
)

func through(proxy string) string {
	u, _ := url.Parse(proxy)
	client := &http.Client{
		Transport: &http.Transport{Proxy: http.ProxyURL(u)},
		Timeout:   30 * time.Second,
	}
	resp, err := client.Get("https://ipinfo.io/json")
	if err != nil {
		return err.Error()
	}
	defer resp.Body.Close()
	body, _ := io.ReadAll(resp.Body)
	return string(body)
}

func main() {
	// Rotating: new IP on every request (port 9000)
	rotating := fmt.Sprintf("http://%s:%s@%s:9000", user, pass, host)
	fmt.Println("rotating:", through(rotating))

	// Country targeting: append -country-XX to the username
	jp := fmt.Sprintf("http://%s-country-jp:%s@%s:9000", user, pass, host)
	fmt.Println("jp exit:", through(jp))

	// Sticky session: same IP for `lifetime` minutes (port 10000)
	sticky := fmt.Sprintf("http://%s-country-us-session-ab12-lifetime-10:%s@%s:10000", user, pass, host)
	fmt.Println("sticky #1:", through(sticky))
	fmt.Println("sticky #2:", through(sticky)) // same IP
}
