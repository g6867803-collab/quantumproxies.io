<?php
// QuantumProxies — PHP quickstart (cURL).
// Rotating residential proxies: new IP per request, sticky sessions, geo-targeting.
// Get credentials at https://quantumproxies.io

$user = 'YOUR_USERNAME'; // from your dashboard
$pass = 'YOUR_PASSWORD';
$host = 'residentialboson.quantumproxies.io';

function through_proxy(string $proxy, string $auth): array {
    $ch = curl_init('https://ipinfo.io/json');
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_PROXY          => $proxy,
        CURLOPT_PROXYUSERPWD   => $auth,
        CURLOPT_TIMEOUT        => 30,
    ]);
    $body = curl_exec($ch);
    curl_close($ch);
    return json_decode($body, true) ?? [];
}

// Rotating: new IP on every request (port 9000)
$ip = through_proxy("http://$host:9000", "$user:$pass");
echo 'rotating: ' . ($ip['ip'] ?? '?') . PHP_EOL;

// Country targeting: append -country-XX to the username
$ip = through_proxy("http://$host:9000", "$user-country-gb:$pass");
echo 'gb exit:  ' . ($ip['ip'] ?? '?') . ' ' . ($ip['country'] ?? '') . PHP_EOL;

// Sticky session: same IP for `lifetime` minutes (port 10000)
$auth = "$user-country-us-session-ab12-lifetime-10:$pass";
echo 'sticky #1: ' . (through_proxy("http://$host:10000", $auth)['ip'] ?? '?') . PHP_EOL;
echo 'sticky #2: ' . (through_proxy("http://$host:10000", $auth)['ip'] ?? '?') . PHP_EOL; // same IP
